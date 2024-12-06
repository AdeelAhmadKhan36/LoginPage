import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  final ValueChanged<String>? onCountryCodeChanged;
  final ValueChanged<String>? onPhoneNumberChanged;

  const PhoneNumberField({
    Key? key,
    this.onCountryCodeChanged,
    this.onPhoneNumberChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
          value: '+91',
          items: ['+91', '+92', '+93']
              .map((code) => DropdownMenuItem(
            child: Text(code),
            value: code,
          ))
              .toList(),
          onChanged: (value) => onCountryCodeChanged?.call(value ?? '+91'),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '0000 00 0000',
              hintStyle: const TextStyle(color: Colors.white60), // Adjust hint color
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
            keyboardType: TextInputType.phone,
            onChanged: onPhoneNumberChanged,
            style: const TextStyle(color: Colors.white), // Adjust text color
          ),
        ),
      ],
    );
  }
}
