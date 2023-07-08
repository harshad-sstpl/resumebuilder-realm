import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final FocusNode? focusNode;
  final valKey;
  const CommonTextField(
      {super.key,
      this.labelText = '',
      this.validator,
      this.controller,
      this.maxLines,
      this.valKey,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: valKey,
      focusNode: focusNode,
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey[600]!)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey[600]!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.red)),
          label: Text(labelText!)),
    );
  }
}
