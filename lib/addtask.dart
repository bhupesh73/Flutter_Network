import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loginuicolors/dashboard.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController taskController = TextEditingController();
  String? _selectedUrgency;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  File? _pickedImage;

  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    } else {
      // Handle if no image is picked
    }
  }

  void _navigateToDashboard() {
    Task task = Task(
      taskName: taskController.text,
      urgency: _selectedUrgency ?? '',
      startDate: _startDate ?? DateTime.now(),
      endDate: _endDate ?? DateTime.now(),
      address: addressController.text,
      description: descriptionController.text,
      image: _pickedImage,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard(task: task)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD TASK'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Task"),
              TextField(
                controller: taskController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const Text("Urgency"),
              DropdownButtonFormField<String>(
                value: _selectedUrgency,
                items: ['High', 'Medium', 'Low'].map((urgency) {
                  return DropdownMenuItem<String>(
                    value: urgency,
                    child: Text(urgency),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUrgency = newValue;
                  });
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Start-Date"),
                        TextFormField(
                          onTap: () => _selectDate(context, true),
                          controller: startDateController,
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("End-Date"),
                        TextFormField(
                          onTap: () => _selectDate(context, false),
                          controller: endDateController,
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Address"),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const Text("Description"),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              _pickedImage == null
                  ? const Text('No image selected.')
                  : Image.file(_pickedImage!), // Display the picked image if available
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _captureImage, // Call the function to capture image
                child: const Text("Take Picture"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToDashboard, // Navigate to Dashboard page
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
          startDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Format the date
        } else {
          _endDate = pickedDate;
          endDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Format the date
        }
      });
    }
  }
}
