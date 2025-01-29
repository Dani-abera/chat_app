import 'package:flutter/material.dart';

class ChatAppTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  const ChatAppTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode ?? FocusNode(),
        onChanged: onChanged,
        obscureText: isPassword, // Toggle password visibility
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).primaryColor,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
