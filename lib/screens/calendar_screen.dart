// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/event_provider.dart';
// import 'event_screen.dart';

// class CalendarScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Календарь")),
//       body: Column(
//         children: [
//           // Тут может быть виджет календаря (например, используем какой-то из пакетов для календарей)
//           Expanded(
//             child: Consumer<EventProvider>(
//               builder: (context, provider, _) {
//                 return ListView.builder(
//                   itemCount: provider.events.length,
//                   itemBuilder: (context, index) {
//                     final event = provider.events[index];
//                     return ListTile(
//                       title: Text(event.title),
//                       subtitle: Text(
//                           "${event.startTime} - ${event.endTime}"),
//                       tileColor: Color(int.parse(event.colorCode)),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => EventScreen()),
//         ),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


// import 'package:dvaroyalya_test/widgets/event_pie_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:fl_chart/fl_chart.dart';
// import '../providers/event_provider.dart';
// import 'event_screen.dart';
// import '../models/event_model.dart';

// class CalendarScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Календарь")),
//       body: Column(
//         children: [
//           // Виджет календаря - упрощенный
//           Expanded(
//             child: Consumer<EventProvider>(
//               builder: (context, provider, _) {
//                 return ListView.builder(
//                   itemCount: provider.events.length,
//                   itemBuilder: (context, index) {
//                     final event = provider.events[index];
//                     return ListTile(
//                       leading: EventPieChart(event),
//                       title: Text(event.title),
//                       subtitle: Text(
//                           "${event.startTime} - ${event.endTime}"),
//                       tileColor: Color(int.parse(event.colorCode)),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => EventScreen()),
//         ),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


// import 'package:dvaroyalya_test/screens/event_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:provider/provider.dart';
// import '../providers/event_provider.dart';
// import '../widgets/event_list.dart';

// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     final events = Provider.of<EventProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Календарь'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             focusedDay: _focusedDay,
//             firstDay: DateTime.utc(2022, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//             eventLoader: (day) => events.getEventsForDay(day),
//             calendarStyle: CalendarStyle(
//               todayDecoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 shape: BoxShape.circle,
//               ),
//               selectedDecoration: BoxDecoration(
//                 color: Colors.blue,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: EventList(selectedDay: _selectedDay),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => EventScreen()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }



// import 'package:dvaroyalya_test/screens/event_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:provider/provider.dart';
// import '../providers/event_provider.dart';
// import '../widgets/event_list.dart';

// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   CalendarFormat _calendarFormat = CalendarFormat.month; // Добавлено для формата

//   @override
//   Widget build(BuildContext context) {
//     final events = Provider.of<EventProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Календарь'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             focusedDay: _focusedDay,
//             firstDay: DateTime.utc(2022, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//             eventLoader: (day) => events.getEventsForDay(day),
//             calendarStyle: CalendarStyle(
//               todayDecoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 shape: BoxShape.circle,
//               ),
//               selectedDecoration: BoxDecoration(
//                 color: Colors.blue,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             onFormatChanged: (format) { // Добавлено для обработки изменения формата
//               setState(() {
//                 _calendarFormat = format;
//               });
//             },
//             calendarFormat: _calendarFormat, // Установка формата календаря
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: EventList(selectedDay: _selectedDay),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => EventScreen()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:dvaroyalya_test/screens/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';
import '../widgets/event_list.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month; // Добавлено для формата

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) => events.getEventsForDay(day),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            onFormatChanged: (format) { // Добавлено для обработки изменения формата
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarFormat: _calendarFormat, // Установка формата календаря
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: EventList(selectedDay: _selectedDay),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
