import 'package:fashion_app/common/bloc/button/button_state.dart';
import 'package:fashion_app/common/bloc/button/button_state_cubit.dart';
import 'package:fashion_app/common/helper/navigator/app_navigator.dart';
import 'package:fashion_app/common/widgets/appbar/basic_appbar.dart';
import 'package:fashion_app/common/widgets/button/basic_reactive_button.dart';
import 'package:fashion_app/data/auth/models/user_sigin_req.dart';
import 'package:fashion_app/domain/auth/usecases/signin.dart';
import 'package:fashion_app/presentation/auth/pages/forgot_password.dart';
import 'package:fashion_app/presentation/auth/pages/signup.dart';
import 'package:fashion_app/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signin extends StatelessWidget {
  final UserSiginReq siginReq;
  Signin({super.key, required this.siginReq});

  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
             listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(
                  context,
                  const HomePage(),
                );
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _signinText(context),
                  const SizedBox(height: 50),
                  _emailField(context),
                  const SizedBox(height: 10),
                  _passwordField(context),
                  const SizedBox(height: 20),
                  _continueButton(context),
                  const SizedBox(height: 10),
                  _createAccount(context),
                  const SizedBox(height: 50),
                  _forgotPassword(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Center(
      child: Text(
        'Sign in',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(
          Icons.mail,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(
          Icons.password,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          siginReq.password = _passwordCon.text;
          siginReq.email = _emailCon.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecase: SigninUseCase(), params: siginReq);
        },
        title: 'Login',
      );
    });
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Dont have an account? ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  Signup(),
                );
              },
            text: ' Sign up',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        AppNavigator.push(
          context,
           ForgotPassword(),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
