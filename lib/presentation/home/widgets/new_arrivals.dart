import 'package:flutter/material.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _newArrivlas(),
        const SizedBox(height: 10),
        _dividerCategory()
      ],
    );
  }

  Widget _newArrivlas() {
    return const Text(
      'NEW ARRIVAL',
      style: TextStyle(
        fontSize: 30,
        letterSpacing: 7,
      ),
    );
  }

  Widget _dividerCategory() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 100,
        right: 100,
      ),
      child: Divider(),
    );
  }
}
