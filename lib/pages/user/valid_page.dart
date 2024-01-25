import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../routes/routes_constants.dart';

class SuccessfullPage extends StatefulWidget {
  const SuccessfullPage({Key? key}) : super(key: key);

  @override
  State<SuccessfullPage> createState() => _SuccessfullPageState();
}

class _SuccessfullPageState extends State<SuccessfullPage> {
  Future<void> redirectPageSetupPage() async {
    if (!await InternetConnectionChecker().hasConnection) {
      if (context.mounted) {
        Navigator.of(context).popAndPushNamed(RoutesConstants.noInternetRoute);
      }
    } else {
      if (context.mounted) {
        Navigator.of(context).popAndPushNamed(RoutesConstants.createAccountRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Successfully!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your Account has been created!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: redirectPageSetupPage,
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
