// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// class TaskTable extends StatefulWidget {
//   @override
//   _TaskTableState createState() => _TaskTableState();
// }

// class _TaskTableState extends State<TaskTable> {
//   Map<int, DateTime?> _startDates = {};
//   Map<int, DateTime?> _endDates = {};

//   void _showStartDatePicker(int rowIndex) {
//     DatePicker.showDatePicker(
//       context,
//       showTitleActions: true,
//       onChanged: (date) {
//         setState(() {
//           _startDates[rowIndex] = date;
//         });
//       },
//       onConfirm: (date) {
//         setState(() {
//           _startDates[rowIndex] = date;
//         });
//       },
//       currentTime: DateTime.now(),
//     );
//   }

//   void _showEndDatePicker(int rowIndex) {
//     DatePicker.showDatePicker(
//       context,
//       showTitleActions: true,
//       onChanged: (date) {
//         setState(() {
//           _endDates[rowIndex] = date;
//         });
//       },
//       onConfirm: (date) {
//         setState(() {
//           _endDates[rowIndex] = date;
//         });
//       },
//       currentTime: DateTime.now(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Task Table'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           columns: <DataColumn>[
//             DataColumn(label: Text('Task Name')),
//             DataColumn(label: Text('Urgency')),
//             DataColumn(label: Text('Start Date')),
//             DataColumn(label: Text('End Date')),
//           ],
//           rows: <DataRow>[
//             DataRow(cells: <DataCell>[
//               DataCell(Text('Task 1')),
//               DataCell(Text('High')),
//               DataCell(
//                 GestureDetector(
//                   onTap: () => _showStartDatePicker(0),
//                   child: Text(_startDates[0] != null
//                       ? _startDates[0]!.toString()
//                       : 'Select Date'),
//                 ),
//               ),
//               DataCell(
//                 GestureDetector(
//                   onTap: () => _showEndDatePicker(0),
//                   child: Text(_endDates[0] != null
//                       ? _endDates[0]!.toString()
//                       : 'Select Date'),
//                 ),
//               ),
//             ]),
//             DataRow(cells: <DataCell>[
//               DataCell(Text('Task 2')),
//               DataCell(Text('Medium')),
//               DataCell(
//                 GestureDetector(
//                   onTap: () => _showStartDatePicker(1),
//                   child: Text(_startDates[1] != null
//                       ? _startDates[1]!.toString()
//                       : 'Select Date'),
//                 ),
//               ),
//               DataCell(
//                 GestureDetector(
//                   onTap: () => _showEndDatePicker(1),
//                   child: Text(_endDates[1] != null
//                       ? _endDates[1]!.toString()
//                       : 'Select Date'),
//                 ),
//               ),
//             ]),
//             // Add more rows as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
