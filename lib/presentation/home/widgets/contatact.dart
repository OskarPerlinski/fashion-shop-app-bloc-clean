import 'package:fashion_app/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Contatact extends StatelessWidget {
  const Contatact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _followUs(),
        const SizedBox(height: 70),
        _dividerContact(),
        const SizedBox(height: 70),
        _otherOptions(),
        const SizedBox(height: 70),
        _dividerContact()
      ],
    );
  }

  Widget _followUs() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          const Text(
            'FOLLOW US',
            style: TextStyle(
              fontSize: 26,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(height: 10),
          SvgPicture.asset(AppVectors.instagramLogo),
        ],
      ),
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

  Widget _otherOptions() {
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
