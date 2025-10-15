import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                _buildAppBar(context),
                const SizedBox(height: 40),
                SvgPicture.asset(AppVectors.logo, height: 60, width: 60),
                const SizedBox(height: 30),
                _registerText(),
                const SizedBox(height: 10),
                _subTitle(),
                const SizedBox(height: 40),
                _fullNameField(),
                const SizedBox(height: 20),
                _emailField(),
                const SizedBox(height: 20),
                _passwordField(),
                const SizedBox(height: 40),
                _createAccountButton(),
                const SizedBox(height: 30),
                _orDivider(),
                const SizedBox(height: 30),
                _socialButtons(),
                const SizedBox(height: 30),
                _signInText(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.04),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      textAlign: TextAlign.center,
    );
  }

  Widget _subTitle() {
    return Text(
      "Create your account to get started",
      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name",
        prefixIcon: Icon(Icons.person_outline, color: Colors.grey.shade600),
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email address",
        hintText: "john@example.com",
        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey.shade600),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "••••••••",
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade600),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey.shade600,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }

  Widget _createAccountButton() {
    return BasicAppButton(
      onPressed: () {
        // Handle signup
      },
      title: "Create Account",
      height: 56,
    );
  }

  Widget _orDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 0.5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Or",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 0.5)),
      ],
    );
  }

  Widget _socialButtons() {
    return Column(
      children: [
        // Google Sign In Button
        _socialButton(
          onPressed: () {
            // Handle Google sign in
          },
          iconPath: AppVectors.google, // Add this to your AppVectors
          label: "Continue with Google",
        ),
        const SizedBox(height: 16),
        // Apple Sign In Button
        _socialButton(
          onPressed: () {
            // Handle Apple sign in
          },
          iconPath: AppVectors.apple, // Add this to your AppVectors
          label: "Continue with Apple",
        ),
      ],
    );
  }

  Widget _socialButton({
    required VoidCallback onPressed,
    required String iconPath,
    required String label,
  }) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: context.isDarkMode
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.grey.shade300,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, height: 24, width: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF42C83C), // AppColors.primary
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
