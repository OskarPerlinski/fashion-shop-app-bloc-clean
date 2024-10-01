import 'package:fashion_app/common/helper/navigator/app_navigator.dart';
import 'package:fashion_app/core/configs/assets/app_vectors.dart';
import 'package:fashion_app/data/auth/models/user_sigin_req.dart';
import 'package:fashion_app/presentation/auth/pages/signin.dart';
import 'package:fashion_app/presentation/home/pages/home.dart';
import 'package:fashion_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:fashion_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Signin(
                siginReq: UserSiginReq(
                  email: _emailCon.text,
                  password: _passwordCon.text,
                ),
              ),
            ),
          );
          if (state is Authenticated) {
            AppNavigator.pushReplacement(
              context,
              const HomePage(),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SvgPicture.asset(AppVectors.appLogo),
        ),
      ),
    );
  }
}
