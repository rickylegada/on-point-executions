import 'package:flutter/material.dart';
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
    final double screenWidth = MediaQuery.of(context).size.width;

    // Check if device is iPad (using screen width for a rough estimate)
    final bool isIpad = screenWidth > 800;

    return BlocProvider(
      create: (_) => LoginCubit(),
      child: 
           BaseScaffold(
            body: Center(
              child: BasePadding.large(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: isIpad ? 500 : 300,
                      child: BaseTextField(
                        controller: usernameController,
                        hintText: 'Enter Username',
                      ),
                    ),
                    const SizedBox(height: 80),
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
          )
        ,
      
    );
  }
}
