// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/event_model.dart';
// import '../providers/event_provider.dart';

// class EventScreen extends StatefulWidget {
//   @override
//   _EventScreenState createState() => _EventScreenState();
// }

// class _EventScreenState extends State<EventScreen> {
//   final TextEditingController titleController = TextEditingController();
//   DateTime? startTime;
//   DateTime? endTime;
//   String colorCode = "0xFF42A5F5";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Добавить событие")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: "Название события"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 startTime = await showDateTimePicker(context);
//               },
//               child: Text(startTime == null ? "Выбрать начало" : "Начало: $startTime"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 endTime = await showDateTimePicker(context);
//               },
//               child: Text(endTime == null ? "Выбрать конец" : "Конец: $endTime"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (startTime != null && endTime != null && titleController.text.isNotEmpty) {
//                   final event = EventModel(
//                     title: titleController.text,
//                     startTime: startTime!,
//                     endTime: endTime!,
//                     colorCode: colorCode,
//                   );
//                   Provider.of<EventProvider>(context, listen: false).addEvent(event);
//                   Navigator.pop(context);
//                 }
//               },
//               child: Text("Добавить событие"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<DateTime?> showDateTimePicker(BuildContext context) async {
//     return showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2025),
//     );
//   }
// }



// import 'package:dvaroyalya_test/widgets/color_picker_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/event_model.dart';
// import '../providers/event_provider.dart';

// class EventScreen extends StatefulWidget {
//   @override
//   _EventScreenState createState() => _EventScreenState();
// }

// class _EventScreenState extends State<EventScreen> {
//   final TextEditingController titleController = TextEditingController();
//   DateTime? startTime;
//   DateTime? endTime;
//   String colorCode = "0xFF42A5F5"; // начальный цвет по умолчанию

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Добавить событие")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: "Название события"),
//             ),
//             ListTile(
//               title: Text(startTime == null
//                   ? "Выбрать начало"
//                   : "Начало: ${startTime!.hour}:${startTime!.minute}"),
//               trailing: Icon(Icons.access_time),
//               onTap: () async {
//                 startTime = await showTimePickerDialog(context);
//                 setState(() {});
//               },
//             ),
//             ListTile(
//               title: Text(endTime == null
//                   ? "Выбрать конец"
//                   : "Конец: ${endTime!.hour}:${endTime!.minute}"),
//               trailing: Icon(Icons.access_time),
//               onTap: () async {
//                 endTime = await showTimePickerDialog(context);
//                 setState(() {});
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Выберите цвет события:"),
//                 GestureDetector(
//                   onTap: () async {
//                     final color = await showDialog<Color>(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           content: SingleChildScrollView(
//                             child: ColorPickerWidget(
//                               selectedColor: Color(int.parse(colorCode)),
//                               onColorSelected: (Color newColor) {
//                                 setState(() {
//                                   colorCode = newColor.value.toString();
//                                 });
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                     setState(() {
//                       colorCode = color?.value.toString() ?? colorCode;
//                     });
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: Color(int.parse(colorCode)),
//                   ),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (startTime != null && endTime != null && titleController.text.isNotEmpty) {
//                   final event = EventModel(
//                     title: titleController.text,
//                     startTime: startTime!,
//                     endTime: endTime!,
//                     colorCode: colorCode,
//                   );
//                   Provider.of<EventProvider>(context, listen: false).addEvent(event);
//                   Navigator.pop(context);
//                 }
//               },
//               child: Text("Добавить событие"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<DateTime> showTimePickerDialog(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     return picked != null
//         ? DateTime(
//             DateTime.now().year,
//             DateTime.now().month,
//             DateTime.now().day,
//             picked.hour,
//             picked.minute,
//           )
//         : DateTime.now();
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';
import '../models/event_model.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final _titleController = TextEditingController();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  Color _selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить событие'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Название'),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) setState(() => _startTime = time);
                  },
                  child: Text('Время начала'),
                ),
                TextButton(
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) setState(() => _endTime = time);
                  },
                  child: Text('Время окончания'),
                ),
              ],
            ),
            Row(
              children: [
                Text('Цвет:'),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: _selectedColor,
                  radius: 15,
                ),
                IconButton(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    // Implement color picker here
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _startTime != null &&
                    _endTime != null) {
                  final newEvent = EventModel(
                    title: _titleController.text,
                    startTime: _startTime!,
                    endTime: _endTime!,
                    color: _selectedColor,
                  );
                  Provider.of<EventProvider>(context, listen: false)
                      .addEvent(DateTime.now(), newEvent);
                  Navigator.pop(context);
                }
              },
              child: Text('Добавить событие'),
            ),
          ],
        ),
      ),
    );
  }
}
