import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/index.dart';
import 'package:on_point_executions/domain/models/event_model.dart';

class AdminDashboard extends StatefulWidget {
  final EventModel? selectedEvent;

  const AdminDashboard({super.key, this.selectedEvent});

  @override
  AdminDashboardState createState() => AdminDashboardState();
}

class AdminDashboardState extends State<AdminDashboard> {
  List<String> fields = ["Enter Field Name"];
  bool isActive = false;

  final TextEditingController eventTitleController = TextEditingController();
  final List<TextEditingController> fieldControllers = [];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isIpad = screenWidth > 800;
    print('testlog adminDashboard - ${widget.selectedEvent}');
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: Column(
          children: [
            if (widget.selectedEvent != null)
              _buildEventDetails()
            else
              _buildEventForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetails() {
    if (widget.selectedEvent == null) {
      return const Text('No event selected');
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText.titleText(
            bold: true,
            'Event Name: ${widget.selectedEvent!.eventName}',
          ),
          BasePadding(
              enableHorizontalPadding: false,
              enableVerticalPadding: true,
              verticalPadding: 8,
              child: BaseText.defaultText(
                  'Registered Users: ${widget.selectedEvent!.registeredUsers}')),
          BasePadding(
            enableHorizontalPadding: false,
            enableVerticalPadding: true,
            verticalPadding: 8,
            child: BaseText.defaultText(
              'Participant List:',
            ),
          ),
          Expanded(
            child: widget.selectedEvent!.participantNames.isEmpty
                ? const Center(child: Text('No participants registered.'))
                : ListView.builder(
                    itemCount: widget.selectedEvent!.participantNames.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(widget.selectedEvent!.participantNames[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventForm() {
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BaseText.defaultText("Event Title: "),
            Expanded(
              child: TextFormField(
                controller: eventTitleController,
                decoration: const InputDecoration(hintText: 'Enter Event Title'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text("Active: "),
            Checkbox(
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value ?? false;
                });
              },
            ),
          ],
        ),
        // Dynamic Form Fields
        for (int i = 0; i < fieldControllers.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              controller: fieldControllers[i],
              decoration: const InputDecoration(hintText: 'Enter Field Name'),
            ),
          ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              fieldControllers.add(TextEditingController());
            });
          },
          child: const Text("Add Another Field"),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Add Event'),
        ),
      ],
    );
  }

  void _submitForm() {
    final eventTitle = eventTitleController.text;
    final fieldValues = fieldControllers.map((controller) => controller.text).toList();

    //context.read<FormCubit>().submitForm(eventTitle, isActive, fieldValues);
  }
}
