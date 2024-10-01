import 'package:fashion_app/common/bloc/button/button_state.dart';
import 'package:fashion_app/common/bloc/button/button_state_cubit.dart';
import 'package:fashion_app/common/helper/navigator/app_navigator.dart';
import 'package:fashion_app/common/widgets/appbar/basic_appbar.dart';
import 'package:fashion_app/common/widgets/button/basic_reactive_button.dart';
import 'package:fashion_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:fashion_app/presentation/auth/pages/password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(),
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
                  AppNavigator.push(context, const PasswordResetEmail());
                }
              },
              child: GestureDetector(
                child: Column(
                  children: [
                    _resetEmail(context),
                    const SizedBox(height: 50),
                    _emailField(context),
                    const SizedBox(height: 20),
                    _continueButton(context),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _resetEmail(BuildContext context) {
    return const Center(
      child: Text(
        'Reset password',
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

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecase: SendPasswordResetEmailUseCase(),
                  params: _emailCon.text,
                );
          },
          title: 'Send email',
        );
      }
    );
  }
}
