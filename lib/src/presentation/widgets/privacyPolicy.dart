import 'package:flutter/material.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
            'By creating or logging into an account you are agreeing with our ',
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(color: Colors.blue),
            // Add gesture recognizer for clickable link
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(text: '.'),
        ],
      ),
    );
  }
}
