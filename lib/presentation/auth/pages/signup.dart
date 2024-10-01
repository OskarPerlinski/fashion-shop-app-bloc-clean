import 'package:fashion_app/common/bloc/button/button_state.dart';
import 'package:fashion_app/common/bloc/button/button_state_cubit.dart';
import 'package:fashion_app/common/helper/navigator/app_navigator.dart';
import 'package:fashion_app/common/widgets/appbar/basic_appbar.dart';
import 'package:fashion_app/common/widgets/button/basic_reactive_button.dart';
import 'package:fashion_app/data/auth/models/user_creation_req.dart';
import 'package:fashion_app/data/auth/models/user_sigin_req.dart';
import 'package:fashion_app/domain/auth/usecases/signup.dart';
import 'package:fashion_app/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _userNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

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
            },
            child: GestureDetector(
              child: Column(
                children: [
                  _signupText(context),
                  const SizedBox(height: 50),
                  _usernameField(context),
                  const SizedBox(height: 10),
                  _emailField(context),
                  const SizedBox(height: 10),
                  _passwordField(context),
                  const SizedBox(height: 20),
                  _continueButton(context),
                  const SizedBox(height: 10),
                  _login(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Center(
      child: Text(
        'Create account',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _usernameField(BuildContext context) {
    return TextField(
      controller: _userNameCon,
      decoration: InputDecoration(
        hintText: 'Username',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(
          Icons.people,
          color: Colors.grey,
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
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecase: SignupUseCase(),
                  params: UserCreationReq(
                    username: _userNameCon.text,
                    email: _emailCon.text,
                    password: _passwordCon.text,
                  ),
                );
          },
          title: 'Sign up',
        );
      }
    );
  }

  Widget _login(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                   Signin(
                    siginReq: UserSiginReq(email: _emailCon.text, password: _passwordCon.text),
                   ),
                );
              },
            text: ' Sign in',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
