import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/index.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title:  BaseText.titleText("Settings", bold: true),
        backgroundColor: Colors.yellow.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseButton(
              text: "Export Registrants as CSV",
              onPressed: () {
                // TODO: Implement CSV export logic
              },
            ),
            const SizedBox(height: 20),
            BaseButton(
              text: "Other Setting Placeholder",
              onPressed: () {
                // Future settings
              },
            ),
          ],
        ),
      ),
    );
  }
}
