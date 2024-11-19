import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/loginpage.dart';
import 'package:flutter_application_1/main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a form key for validation and form state management
    final _formKey = GlobalKey<FormState>();

    // TextEditingControllers to capture input values
    AuthService _authService = AuthService();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to the login screen when pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text(
                "Login"), // Changed from 'Signup' to 'Login' for consistency
          ),
        ],
      ),
      body: Form(
        key: _formKey, // Attach form key here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    print('Email: ${emailController.text}');
                    print('Password: ${passwordController.text}');
                    String? response = await _authService.registration(
                        email: emailController.text,
                        password: passwordController.text);
                    print(response);
                  } else {
                    print('Form is not valid');
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
