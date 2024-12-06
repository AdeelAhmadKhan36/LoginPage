import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const PasswordField({Key? key, this.onChanged}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true; // Track password visibility

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscured, // Control whether the text is obscured
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.white60), // Adjust hint color
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility : Icons.visibility_off,
            color: Colors.white, // Adjust icon color
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured; // Toggle the obscure text state
            });
          },
        ),
        fillColor: Colors.grey.shade700, // Set background color
        filled: true, // Enable filled background
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ), // Adjust padding
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
          borderSide: BorderSide.none, // No border line
        ),
      ),
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.white), // Adjust text color
    );
  }
}
