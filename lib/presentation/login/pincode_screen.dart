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
  
    final double screenWidth = MediaQuery.of(context).size.width;

    // Check if device is iPad (using screen width for a rough estimate)
    final bool isIpad = screenWidth > 800;

    final buttonSize =  isIpad ? 110.0 : 70.0;
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isPinCodeSuccess && state.pin.length == 4) {
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (context) => const DashboardScreen(events: [])),
            //   (Route<dynamic> route) => false,
            // );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardScreen(events: [
                        {'name': 'Event 1', 'isActive': true},
                        {'name': 'Event 2', 'isActive': false},
                      ])),
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          return BaseScaffold(
            title: "Enter Pin code",
            body: Center(
              child: BasePadding.large(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: state.pin.length > index
                                  ? Colors.black
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: buttonSize * 3 + 16,
                      height: buttonSize * 4 + 24,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,// Square aspect ratio
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                      
                          if (index < 9) {
                            return SizedBox(
                              width: buttonSize,
                              height: buttonSize,
                              child: TextButton(
                                onPressed: () {
                                  if (state.pin.length < 4) {
                                    context
                                        .read<LoginCubit>()
                                        .addPin((index + 1).toString());
                                  }
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  (index + 1).toString(),
                                  style:  TextStyle(
                                    fontSize: isIpad ? 32: 24,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            );
                          } else if (index == 9) {
                            return const SizedBox.shrink();
                          } else if (index == 10) {
                            return SizedBox(
                              width: buttonSize,
                              height: buttonSize,
                              child: TextButton(
                                onPressed: () {
                                  if (state.pin.length < 4) {
                                    context.read<LoginCubit>().addPin('0');
                                  }
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Text('0',
                                    style: TextStyle(
                                        fontSize: isIpad ? 32: 24, color: Colors.blue)),
                              ),
                            );
                          } else {
                            return SizedBox(
                              width: buttonSize,
                              height: buttonSize,
                              child: IconButton(
                                onPressed: () {
                                  context.read<LoginCubit>().removePin();
                                },
                                icon: const Icon(Icons.backspace),
                                color: Colors.blue,
                                iconSize: 20,
                              ),
                            );
                          }
                        },
                      ),
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
