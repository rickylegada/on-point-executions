import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/index.dart';
import 'package:on_point_executions/config/configuration.dart';
import 'package:on_point_executions/presentation/dashboard/widgets/event_card.dart';
import 'package:on_point_executions/presentation/registration/registration_screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events;

  const DashboardScreen({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Adjust padding based on screen width
    final double horizontalPadding = screenWidth > 600 ? 32.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BaseText.titleText(Config.appName, bold: true),
        backgroundColor: Colors.yellow.shade700, // Use yellow as app bar color
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return GestureDetector(
              onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(eventName: '',),
      ),
            );},
              child: EventCard(
                eventName: event['name'],
                isActive: event['isActive'],
              ),
            );
          },
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.yellow.shade700, // Consistent bottom bar color
      //   child: IconButton(
      //     icon: Icon(Icons.settings, color: Colors.white),
      //     onPressed: () {
      //       // Handle settings button press
      //       print('Settings Button Pressed');
      //     },
      //   ),
      // ),
    );
  }
}
