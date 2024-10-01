import 'package:fashion_app/presentation/home/widgets/banner.dart';
import 'package:fashion_app/presentation/home/widgets/collections.dart';
import 'package:fashion_app/presentation/home/widgets/contatact.dart';
import 'package:fashion_app/presentation/home/widgets/description.dart';
import 'package:fashion_app/presentation/home/widgets/header.dart';
import 'package:fashion_app/presentation/home/widgets/new_arrivals.dart';
import 'package:fashion_app/presentation/home/widgets/new_item.dart';
import 'package:fashion_app/presentation/home/widgets/trending.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 10),
              Bannerphoto(),
              SizedBox(height: 20),
              NewArrivals(),
              SizedBox(height: 20),
              NewItems(),
              SizedBox(height: 50),
              Collections(),
              SizedBox(height: 30),
              Trending(),
              SizedBox(height: 70),
              Description(),
              SizedBox(height: 70),
              Contatact()
            
            ],
          ),
        ),
      ),
    );
  }
}
