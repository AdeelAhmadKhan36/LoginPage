import 'package:flutter/material.dart';
import 'package:hifah_tech_task/view/widgets/password_widget.dart';
import 'package:hifah_tech_task/view/widgets/phoneno_widget.dart';
import 'package:hifah_tech_task/view_model/view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;  // State for toggling password visibility

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff1c153e), // Set the background color to #1c153e
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white), // Set back arrow color to white
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Title Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Login to",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white), // White color for "Login to"
                    ),
                    Row(
                      children: [
                        Text(
                          "Healthful",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "Account",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Welcome back! Please login to your account to continue.",
                  style: TextStyle(fontSize: 16, color: Colors.white60), // White color for "Welcome back"
                ),
                const SizedBox(height: 60),

                // Phone Number Field with Country Code Dropdown
                // Update the country code list to have 10 values
                Container(
                  height: 60,
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: "0000 00 0000",
                      hintStyle: const TextStyle(color: Colors.white60), // White hint text
                      prefixIcon: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(20), // Radius set to 20
                        ),
                        child: DropdownButton<String>(
                          value: '+92',
                          items: [
                            '+91', '+92', '+93', '+94', '+95'
                          ].map((code) => DropdownMenuItem(
                            child: Text(code, style: const TextStyle(color: Colors.white)),
                            value: code,
                          )).toList(),
                          onChanged: (value) => viewModel.updateCountryCode(value ?? '+91'),
                          underline: const SizedBox(),
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),

                        filled: true,
                        fillColor: Colors.grey.shade700, // Grey color background for the field

                    ),


                    style: const TextStyle(color: Colors.white), // White text for phone number
                    keyboardType: TextInputType.phone,
                    onChanged: viewModel.updatePhoneNumber,
                  ),
                ),

                const SizedBox(height: 20),

                // Password Field with Fingerprint Icon and Obscure Icon
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: !_isPasswordVisible, // Toggle visibility based on _isPasswordVisible
                          decoration: InputDecoration(

                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.white60), // White hint text
                            prefixIcon: const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),

                            ),
                              filled: true,
                              fillColor: Colors.grey.shade700, // Grey color background for the field

                          ),
                          style: const TextStyle(color: Colors.white), // White text for password
                          onChanged: viewModel.updatePassword,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.fingerprint, size: 32, color: Colors.white), // White fingerprint icon
                        onPressed: () {
                          // Implement fingerprint login
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Forgotten Password
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      "Forgotten Password?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Set button background color
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      try {
                        await viewModel.login();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login successful!')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Login With Text
                const Center(
                  child: Text(
                    "Login With",
                    style: TextStyle(fontSize: 16, color: Colors.white60),
                  ),
                ),
                const SizedBox(height: 32),

                // Social Media Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialLoginButton(
                      screenWidth,
                      "Assets/Images/fbr.png", // Facebook logo asset path
                      "Facebook",
                       Colors.grey.shade700,
                    ),
                    const SizedBox(width: 16),
                    _socialLoginButton(
                      screenWidth,
                      "Assets/Images/google.png", // Google logo asset path
                      "Google",
                      Colors.grey.shade700,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton(
      double screenWidth, String imagePath, String text, Color backgroundColor) {
    return Container(
      width: screenWidth * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
