import 'package:fashion_app/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class Bannerphoto extends StatelessWidget {
  const Bannerphoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.profile,
          ),
        ),
      ),
    );
  }
}
