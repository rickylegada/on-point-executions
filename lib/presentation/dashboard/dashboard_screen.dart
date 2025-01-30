import 'package:flutter/material.dart';
import 'package:on_point_executions/common/config/configuration.dart';
import 'package:on_point_executions/common/widgets/base_scaffold.dart';
import 'package:on_point_executions/common/widgets/index.dart';
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
    final double horizontalPadding = screenWidth > 600 ? 32.0 : 16.0;

    return BaseScaffold(
      appBar: AppBar(
      centerTitle: true,
      title: BaseText.titleText(Config.appName, bold: true),
      backgroundColor: Colors.yellow,

    ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(
                      eventName: '',
                    ),
                  ),
                );
              },
              child: EventCard(
                eventName: event['name'],
                isActive: event['isActive'],
              ),
            );
          },
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: BaseText.titleText(
                'Options',
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Implement your logout functionality here
                Navigator.pop(context); // Close the drawer after logging out
              },
            ),
            // You can add more items here such as Profile, Settings, etc.
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings screen
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}