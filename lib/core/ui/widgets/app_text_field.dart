import 'package:flutter/material.dart';

import '../../theme/app_radius.dart';
import '../../theme/design_tokens.dart';

enum AppTextFieldType { text, email, password, search }

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;

  final String? label;

  final String? hint;

  final String? Function(String?)? validator;

  final TextInputType? keyboardType;

  final bool enabled;

  final bool readOnly;

  final int maxLines;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final ValueChanged<String>? onChanged;

  final AppTextFieldType type;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.type = AppTextFieldType.text,
  });

  const AppTextField.email({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
  }) : type = AppTextFieldType.email,
       keyboardType = TextInputType.emailAddress,
       maxLines = 1,
       prefixIcon = null,
       suffixIcon = null;

  const AppTextField.password({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
  }) : type = AppTextFieldType.password,
       keyboardType = TextInputType.visiblePassword,
       maxLines = 1,
       prefixIcon = null,
       suffixIcon = null;

  const AppTextField.search({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
  }) : type = AppTextFieldType.search,
       keyboardType = TextInputType.text,
       maxLines = 1,
       prefixIcon = const Icon(Icons.search),
       suffixIcon = null;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  bool get _isPassword => widget.type == AppTextFieldType.password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DesignTokens.inputHeight,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        maxLines: _isPassword ? 1 : widget.maxLines,
        obscureText: _isPassword ? _obscure : false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: _buildSuffix(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (_isPassword) {
      return IconButton(
        onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
      );
    }

    return widget.suffixIcon;
  }
}
