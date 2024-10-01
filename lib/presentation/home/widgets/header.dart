import 'package:fashion_app/common/helper/navigator/app_navigator.dart';
import 'package:fashion_app/core/configs/assets/app_vectors.dart';
import 'package:fashion_app/presentation/cart/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _menu(context),
          _logoImage(),
          _bag(context),
        ],
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return const Icon(
      Icons.menu,
      color: Colors.black,
      size: 30,
    );
  }

  Widget _bag(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          const CartPage(),
        );
      },
      child: const Icon(
        Icons.shopping_bag_outlined,
        size: 30,
      ),
    );
  }

  Widget _logoImage() {
    return SvgPicture.asset(
      AppVectors.appLogo,
    );
  }
}
