import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tinderjob/routes/routes_constants.dart';
import 'package:tinderjob/services/reg_exp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = 'a';
  String confirmPassword = '';

  Future<void> redirectPageToSigUp() async {
    if (!await InternetConnectionChecker().hasConnection) {
      if (context.mounted) {
        Navigator.of(context).popAndPushNamed(RoutesConstants.noInternetRoute);
      }
    } else {
      if (context.mounted) {
        // Navigator.of(context).popAndPushNamed(RoutesConstants.signUpRoute);
      }
    }
  }

  void _trySubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // If the form is valid, display a snackbar.
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sign Up')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Enter Your Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    confirmPassword = value!;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _trySubmit,
                    child: const Text('Sign Up'),
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
