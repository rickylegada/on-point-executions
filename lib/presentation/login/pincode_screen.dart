import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_point_executions/common/widgets/index.dart';
import 'package:on_point_executions/presentation/dashboard/dashboard_screen.dart';

import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({super.key});

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
            title: "Enter Pin code",
            body: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 250, right: 250),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: state.pin.length > index ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        final buttonSize = 50.0; // Fixed button size

                        if (index < 9) {
                          return SizedBox(
                            width: buttonSize,
                            height: buttonSize,
                            child: ElevatedButton(
                              onPressed: () {
                                if (state.pin.length < 4) {
                                  context.read<LoginCubit>().addPin((index + 1).toString());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        } else if (index == 9) {
                          return const SizedBox.shrink();
                        } else if (index == 10) {
                          return SizedBox(
                            width: buttonSize,
                            height: buttonSize,
                            child: ElevatedButton(
                              onPressed: () {
                                if (state.pin.length < 4) {
                                  context.read<LoginCubit>().addPin('0');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text('0', style: TextStyle(fontSize: 20)),
                            ),
                          );
                        } else {
                          return SizedBox(
                            width: buttonSize,
                            height: buttonSize,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<LoginCubit>().removePin();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Icon(Icons.backspace, size: 20),
                            ),
                          );
                        }
                      },
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
