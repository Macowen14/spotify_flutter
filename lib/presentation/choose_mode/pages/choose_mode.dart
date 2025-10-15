import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final currentMode = context.watch<ThemeCubit>().state;

    final isDarkSelected = currentMode == ThemeMode.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBg),
              ),
            ),
          ),

          // Overlay
          IgnorePointer(
            child: Container(color: Colors.black.withValues(alpha: 0.35)),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.logo),
                const Spacer(),

                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 40),

                // Mode options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildModeOption(
                      svgPath: AppVectors.sun,
                      label: "Light Mode",
                      selected: !isDarkSelected,
                      onTap: () => themeCubit.updateTheme(ThemeMode.light),
                    ),
                    const SizedBox(width: 30),
                    _buildModeOption(
                      svgPath: AppVectors.moon,
                      label: "Dark Mode",
                      selected: isDarkSelected,
                      onTap: () => themeCubit.updateTheme(ThemeMode.dark),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                BasicAppButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupOrSignIn()),
                    );
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeOption({
    required String svgPath,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? AppColors.primary.withValues(alpha: 0.9)
                      : Colors.white.withValues(alpha: 0.2),
                  border: Border.all(
                    color: selected ? AppColors.primary : AppColors.darkGrey,
                    width: 2,
                  ),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svgPath,
                    height: 45,
                    width: 45,
                    colorFilter: ColorFilter.mode(
                      selected ? AppColors.darkBackground : AppColors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.primary : Colors.white,
              fontSize: 16,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
