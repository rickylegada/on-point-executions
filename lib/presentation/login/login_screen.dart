import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/base_scaffold.dart';
import 'package:on_point_executions/common/widgets/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_point_executions/presentation/dashboard/dashboard_screen.dart';
import 'package:on_point_executions/presentation/login/pincode_screen.dart';

import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isPinCodeSuccess && state.pin.length == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen(events: [])),
            );
          }
        },
        builder: (context, state) {
          return BaseScaffold(
            body: Center(
              child: BasePadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseTextField(
                      controller: usernameController,
                      hintText: 'Enter Username',
                    ),
                    const SizedBox(height: 20),
                    BaseButton(
                      onPressed: () {
                        if (usernameController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PinCodeScreen()),
                          );
                        }
                      },
                      text: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
