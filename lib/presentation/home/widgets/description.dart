import 'package:fashion_app/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _logoImage(),
        const SizedBox(height: 30),
        _description(),
        const SizedBox(height: 70),
        _dividerDescription()
        
      ],
    );
  }

  Widget _logoImage () {
    return SvgPicture.asset(AppVectors.appLogo, height: 40);
  }

  Widget _description () {
    return const Padding(
      padding: EdgeInsets.only(left: 75, right: 75),
      child: Text(
        'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _dividerDescription() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 100,
        right: 100,
      ),
      child: Divider(),
    );
  }
}