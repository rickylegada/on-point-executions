import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/index.dart';

import 'package:on_point_executions/presentation/settings/settings_screen.dart';


class RegistrationScreen extends StatelessWidget {
  final String eventName;
  RegistrationScreen({super.key,required this.eventName, });

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text("Event Name", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: BaseText.titleText(
                          "2025 Year-End Party",
                          bold: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BaseTextField(
                hintText: "Enter your name",
                controller: nameController,

              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BaseButton(text: "Register", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}