// import 'package:flutter/material.dart';
// import '../models/event_model.dart';
// import '../services/database_service.dart';

// class AddEventScreen extends StatefulWidget {
//   @override
//   _AddEventScreenState createState() => _AddEventScreenState();
// }

// class _AddEventScreenState extends State<AddEventScreen> {
//   final _titleController = TextEditingController();
//   TimeOfDay _startTime = TimeOfDay.now();
//   TimeOfDay _endTime = TimeOfDay.now();
//   Color _color = Colors.blue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Event')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
//             ElevatedButton(
//               onPressed: () async {
//                 final event = EventModel(
//                   title: _titleController.text,
//                   startTime: _startTime,
//                   endTime: _endTime,
//                   color: _color,
//                 );
//                 await DatabaseService().insertEvent(event);
//                 Navigator.pop(context);
//               },
//               child: Text('Save Event'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import '../models/event_model.dart';
// import '../services/database_service.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// class AddEventScreen extends StatefulWidget {
//   @override
//   _AddEventScreenState createState() => _AddEventScreenState();
// }

// class _AddEventScreenState extends State<AddEventScreen> {
//   final _titleController = TextEditingController();
//   TimeOfDay _startTime = TimeOfDay.now();
//   TimeOfDay _endTime = TimeOfDay.now();
//   Color _color = Colors.blue;

//   Future<void> _selectTime(BuildContext context, bool isStartTime) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: isStartTime ? _startTime : _endTime,
//     );
//     if (picked != null && picked != (isStartTime ? _startTime : _endTime)) {
//       setState(() {
//         if (isStartTime) {
//           _startTime = picked;
//         } else {
//           _endTime = picked;
//         }
//       });
//     }
//   }

//   Future<void> _selectColor(BuildContext context) async {
//     Color? pickedColor = await showDialog<Color>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Choose Color'),
//           content: SingleChildScrollView(
//             child: BlockPicker(
//               pickerColor: _color,
//               onColorChanged: (color) {
//                 pickedColor = color;
//               },
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: Text('Select'),
//               onPressed: () {
//                 Navigator.of(context).pop(pickedColor);
//               },
//             ),
//           ],
//         );
//       },
//     );

//     if (pickedColor != null) {
//       setState(() {
//         _color = pickedColor;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Event')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Start Time: ${_startTime.format(context)}'),
//                 ElevatedButton(
//                   onPressed: () => _selectTime(context, true),
//                   child: Text('Select Start Time'),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('End Time: ${_endTime.format(context)}'),
//                 ElevatedButton(
//                   onPressed: () => _selectTime(context, false),
//                   child: Text('Select End Time'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Color:'),
//                 GestureDetector(
//                   onTap: () => _selectColor(context),
//                   child: Container(
//                     width: 50,
//                     height: 50,
//                     color: _color,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 final event = EventModel(
//                   title: _titleController.text,
//                   startTime: _startTime,
//                   endTime: _endTime,
//                   color: _color,
//                 );
//                 await DatabaseService().insertEvent(event);
//                 Navigator.pop(context);
//               },
//               child: Text('Save Event'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../models/event_model.dart';
import '../services/database_service.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _titleController = TextEditingController();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  Color _color = Colors.blue;

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  void _selectColor(BuildContext context) {
    showDialog<Color>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _color,
              onColorChanged: (color) {
                setState(() {
                  _color = color; // Обновляем цвет сразу при выборе
                });
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('Select'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Start Time: ${_startTime.format(context)}'),
                ElevatedButton(
                  onPressed: () => _selectTime(context, true),
                  child: Text('Select Start Time'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('End Time: ${_endTime.format(context)}'),
                ElevatedButton(
                  onPressed: () => _selectTime(context, false),
                  child: Text('Select End Time'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Color:'),
                GestureDetector(
                  onTap: () => _selectColor(context),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: _color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final event = EventModel(
                  title: _titleController.text,
                  startTime: _startTime,
                  endTime: _endTime,
                  color: _color,
                );
                await DatabaseService().insertEvent(event);
                Navigator.pop(context);
              },
              child: Text('Save Event'),
            ),
          ],
        ),
      ),
    );
  }
}
