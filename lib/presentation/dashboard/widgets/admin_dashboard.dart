import 'package:flutter/material.dart';
import 'package:on_point_executions/domain/models/admin_dashboard_model.dart';

class AdminDashboard extends StatefulWidget {
  final AdminDashboardModel? selectedEvent;

  const AdminDashboard({super.key, this.selectedEvent});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<String> fields = ["Enter Field Name"];
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    print('testlog adminDashboard - ${widget.selectedEvent}');
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: widget.selectedEvent != null ? _buildEventDetails() : _buildEventForm(),
    );
  }

Widget _buildEventDetails() {
  if (widget.selectedEvent == null) {
    return const Text('No event selected');
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Event Name: ${widget.selectedEvent!.eventName}',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Text('Registered Users: ${widget.selectedEvent!.registeredUsers}'),
      const SizedBox(height: 16),
      const Text(
        'Participant List:',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      Expanded(
        child: widget.selectedEvent!.participantNames.isEmpty
            ? const Center(child: Text('No participants registered.'))
            : ListView.builder(
                itemCount: widget.selectedEvent!.participantNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.selectedEvent!.participantNames[index]),
                  );
                },
              ),
      ),
    ],
  );
}


  Widget _buildEventForm() {
    print("testlog buildEventForm");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Event Title: "),
            Expanded(
              child: TextFormField(
                initialValue: '',
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
                setState(() => isActive = value ?? false);
              },
            ),
          ],
        ),
        for (String field in fields)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              initialValue: field,
              decoration: const InputDecoration(hintText: 'Enter Field Name'),
            ),
          ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            setState(() => fields.add("Enter Field Name"));
          },
          child: const Text("Add Another Field"),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            // Handle event addition
          },
          child: const Text('Add Event'),
        ),
      ],
    );
  }
}
