import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/index.dart';
import 'package:on_point_executions/presentation/login/pincode_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isIpad = screenWidth > 800;

    return BaseScaffold(
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
                  print('ricky - ${usernameController.text}');
                  if (usernameController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PinCodeScreen(
                          username: usernameController.text,
                        ),
                      ),
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
  }
}
