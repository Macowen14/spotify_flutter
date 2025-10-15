import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

enum ButtonType { primary, secondary, outline, text }

class BasicAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  final double? width;
  final ButtonType type;
  final IconData? icon;
  final bool isLoading;
  final double fontSize;
  final FontWeight fontWeight;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.type = ButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: height ?? 56,
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(isDark),
        child: isLoading ? _buildLoadingIndicator() : _buildContent(),
      ),
    );
  }

  ButtonStyle _getButtonStyle(bool isDark) {
    switch (type) {
      case ButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        );

      case ButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
          foregroundColor: isDark ? Colors.white : Colors.black,
          disabledBackgroundColor: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.black.withValues(alpha: 0.03),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        );

      case ButtonType.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          disabledBackgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          side: BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        );

      case ButtonType.text:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          disabledBackgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        );
    }
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(
          type == ButtonType.primary ? Colors.white : AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: fontSize + 2),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
        ],
      );
    }

    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

// Convenience constructors for common use cases
extension BasicAppButtonExtensions on BasicAppButton {
  static BasicAppButton primary({
    required VoidCallback? onPressed,
    required String title,
    double? height,
    double? width,
    IconData? icon,
    bool isLoading = false,
  }) {
    return BasicAppButton(
      onPressed: onPressed,
      title: title,
      height: height,
      width: width,
      type: ButtonType.primary,
      icon: icon,
      isLoading: isLoading,
    );
  }

  static BasicAppButton secondary({
    required VoidCallback? onPressed,
    required String title,
    double? height,
    double? width,
    IconData? icon,
    bool isLoading = false,
  }) {
    return BasicAppButton(
      onPressed: onPressed,
      title: title,
      height: height,
      width: width,
      type: ButtonType.secondary,
      icon: icon,
      isLoading: isLoading,
    );
  }

  static BasicAppButton outline({
    required VoidCallback? onPressed,
    required String title,
    double? height,
    double? width,
    IconData? icon,
    bool isLoading = false,
  }) {
    return BasicAppButton(
      onPressed: onPressed,
      title: title,
      height: height,
      width: width,
      type: ButtonType.outline,
      icon: icon,
      isLoading: isLoading,
    );
  }

  static BasicAppButton text({
    required VoidCallback? onPressed,
    required String title,
    double? height,
    double? width,
    IconData? icon,
    bool isLoading = false,
  }) {
    return BasicAppButton(
      onPressed: onPressed,
      title: title,
      height: height,
      width: width,
      type: ButtonType.text,
      icon: icon,
      isLoading: isLoading,
    );
  }
}
