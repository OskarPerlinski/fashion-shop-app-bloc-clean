import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _dividerContact(),
        const SizedBox(height: 50),
        _options(),
        const SizedBox(height: 50),
        _dividerContact()
      ],
    );
  }

  Widget _dividerContact() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 100,
        right: 100,
      ),
      child: Divider(),
    );
  }

  Widget _options() {
    return const Column(
      children: [
        Text(
          'support@openui.design',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          '+60 825 876',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "08:00 - 22:00 - Everyday",
          style: TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}