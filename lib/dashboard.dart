import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginuicolors/addtask.dart';

class Dashboard extends StatefulWidget {
  final Task? task;

  const Dashboard({Key? key, this.task}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: widget.task != null ? _buildTaskInfo() : _buildNoTaskInfo(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskInfo() {
    final dateFormat = DateFormat('yyyy-MM-dd');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          title: Text(widget.task!.taskName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Urgency: ${widget.task!.urgency}"),
              Text("Start Date: ${dateFormat.format(widget.task!.startDate)}"),
              Text("End Date: ${dateFormat.format(widget.task!.endDate)}"),
              Text("Address: ${widget.task!.address}"),
              Text("Description: ${widget.task!.description}"),
            ],
          ),
          
          // trailing: Icon(Icons.check_circle, color: Colors.green),
        ),
      ),
    );
  }

  Widget _buildNoTaskInfo() {
    return const Text("No task added yet.");
  }
}

class Task {
  final String taskName;
  final String urgency;
  final DateTime startDate;
  final DateTime endDate;
  final String address;
  final String description;

  Task({
    required this.taskName,
    required this.urgency,
    required this.startDate,
    required this.endDate,
    required this.address,
    required this.description,
    File? image,
  });
}
