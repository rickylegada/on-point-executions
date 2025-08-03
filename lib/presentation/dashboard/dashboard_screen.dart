import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_point_executions/common/config/configuration.dart';
import 'package:on_point_executions/common/widgets/index.dart';
import 'package:on_point_executions/domain/models/event_model.dart';
import 'package:on_point_executions/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:on_point_executions/presentation/dashboard/cubit/dashboard_state.dart';
import 'package:on_point_executions/presentation/dashboard/widgets/admin_dashboard.dart';
import 'package:on_point_executions/presentation/dashboard/widgets/event_list.dart';
import 'package:on_point_executions/presentation/login/login_screen.dart';
import 'package:on_point_executions/presentation/qr/generate_qr_code_screen.dart';
import 'package:on_point_executions/presentation/registration/registration_screen.dart';

class DashboardScreen extends StatefulWidget {
  final List<Map<String, dynamic>> events;
  final bool isAdmin;

  const DashboardScreen(
      {super.key, required this.events, required this.isAdmin});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int? focusedEventIndex;

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final double horizontalPadding = screenWidth > 600 ? 32.0 : 16.0;

    return BlocProvider(
      create: (context) => DashboardCubit()..login(widget.isAdmin),
      child: BaseScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: BaseText.titleText(Config.appName, bold: true),
          backgroundColor: Colors.yellow,
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eventList(state, context),
                if (state.isAdmin)
                  AdminDashboard(
                      selectedEvent: (state.focusedIndex == null)
                          ? null
                          : state.eventModel),
              ],
            );
          },
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.yellow),
                child: BaseText.titleText('Options'),
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.qr_code),
                title: Text('Generate QR Code'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GenerateQRCodeScreen()),
                  );
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.settings),
              //   title: const Text('Settings'),
              //   onTap: () => Navigator.pop(context),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget eventList(DashboardState state, BuildContext context) {
    return EventList(
      events: widget.events.map((event) {
        return EventModel(
          eventName: event['name'],
          isActive: event['isActive'],
          registeredUsers: 0,
          participantNames: [
            'ricky',
            'ricky 2',
            'ricky',
            'ricky 2',
            'ricky',
            'ricky 2',
            'ricky',
            'ricky 2',
            'ricky',
            'ricky 2',
            'ricky',
            'ricky 2'
          ],
        );
      }).toList(),
      onEventTap: (eventModel, index) {
        if (state.isAdmin) {
          context.read<DashboardCubit>().selectEvent(
              eventModel, (index == state.focusedIndex) ? null : index);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationScreen(
                eventName: 'test',
              ),
            ),
          );
        }
      },
      focusedEventIndex: state.focusedIndex,
    );
  }
}
