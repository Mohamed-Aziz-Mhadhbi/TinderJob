import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _googleSignIn = GoogleSignIn();
  String email = '';
  String password = '';

  void _trySubmit() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar.
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Or Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Enter Your Email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password',
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _trySubmit,
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text('Forgot your password?'),
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You don\'t have an account?'),
                    SizedBox(width: 8),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final GoogleSignInAccount? googleUser =
                            await _googleSignIn.signIn();
                        if (googleUser != null) {
                          // User signed in successfully
                          // You can get user details here
                        }
                      } catch (error) {
                        // Handle errors
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        const Text('Sign in with Google'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
