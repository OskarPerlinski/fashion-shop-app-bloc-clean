import 'package:fashion_app/common/widgets/appbar/basic_appbar.dart';
import 'package:flutter/material.dart';

class PasswordResetEmail extends StatelessWidget {
  const PasswordResetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _sentEmail(),
          ],
        ),
      ),
    );
  }

  

  Widget _sentEmail() {
    return const Center(
      child: Text(
        'We Sent you an Email to reset your password.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}