import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.ctrlr,
    required this.enabled,
    required this.hint,
    required this.fontSize,
  });

  final TextEditingController ctrlr;
  final bool enabled;
  final String hint;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrlr,
      enabled: enabled,

      // Input Text Styles
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: color_constants.mainText,
            fontSize: fontSize,
          ),

      // Decorations
      decoration: InputDecoration(
        fillColor: const Color(0xFFF3F3F3),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),

        // hint
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: color_constants.subText,
              fontSize: fontSize,
            ),
      ),
    );
  }
}
