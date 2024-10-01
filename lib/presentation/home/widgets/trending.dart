import 'package:flutter/material.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _trending(),
        const SizedBox(height: 30),
        _hashtag(),
      ],
    );
  }

  Widget _trending() {
    return const Text(
      '@TRENDING',
      style: TextStyle(
        fontSize: 25,
        letterSpacing: 6,
      ),
    );
  }

  Widget _hashtag() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('#2024'),
              Text('#spring'),
              Text('#collections'),
              Text('#fall')
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('#dress'),
              Text('#autumncollection'),
              Text('#openfashion')
            ],
          )
        ],
      ),
    );
  }
}
