import 'package:fashion_app/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _collections(),
        const SizedBox(height: 30),
        _octoberCollections(),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _collections() {
    return const Text(
      'COLLECTIONS',
      style: TextStyle(
        fontSize: 25,
        letterSpacing: 6
      ),
    );
  }

  Widget _octoberCollections() {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.octoberCollections,
          ),
        ),
      ),
    );
  }

  
}