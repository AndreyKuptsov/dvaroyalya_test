// import 'package:flutter/material.dart';
// import '../services/database_service.dart';
// import '../models/event_model.dart';
// import 'add_event_screen.dart';
// import '../widgets/event_tile.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<EventModel>> _events;

//   @override
//   void initState() {
//     super.initState();
//     _loadEvents();
//   }

//   void _loadEvents() {
//     _events = DatabaseService().getEvents();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Event Calendar'),
//       ),
//       body: FutureBuilder<List<EventModel>>(
//         future: _events,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return CircularProgressIndicator();
//           final events = snapshot.data!;
//           return ListView.builder(
//             itemCount: events.length,
//             itemBuilder: (context, index) => EventTile(event: events[index]),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddEventScreen()),
//           );
//           _loadEvents();
//           setState(() {});
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../services/database_service.dart';
// import '../models/event_model.dart';
// import 'add_event_screen.dart';
// import '../widgets/event_tile.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<EventModel>> _events;

//   @override
//   void initState() {
//     super.initState();
//     _loadEvents();
//   }

//   void _loadEvents() {
//     _events = DatabaseService().getEvents();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Event Calendar'),
//       ),
//       body: FutureBuilder<List<EventModel>>(
//         future: _events,
//         builder: (context, snapshot) {
//           // Проверка состояния соединения
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } 
//           // Обработка ошибки
//           else if (snapshot.hasError) {
//             return Center(child: Text('Ошибка: ${snapshot.error}'));
//           } 
//           // Проверка наличия данных
//           else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('Нет событий'));
//           }

//           final events = snapshot.data!;
//           return ListView.builder(
//             itemCount: events.length,
//             itemBuilder: (context, index) => EventTile(event: events[index]),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddEventScreen()),
//           );
//           _loadEvents(); // Перезагрузка событий после добавления
//           setState(() {}); // Обновление состояния
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../models/event_model.dart';
import 'add_event_screen.dart';
import '../widgets/event_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<EventModel>> _events;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() {
    _events = DatabaseService().getEvents().then((events) {
      print('Loaded events: $events'); // Логирование загруженных событий
      return events;
    }).catchError((error) {
      print('Error loading events: $error'); // Логирование ошибки
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
      ),
      body: FutureBuilder<List<EventModel>>(
        future: _events,
        builder: (context, snapshot) {
          // Проверка состояния соединения
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } 
          // Обработка ошибки
          else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } 
          // Проверка наличия данных
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Нет событий'));
          }

          final events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) => EventTile(event: events[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEventScreen()),
          );
          _loadEvents(); // Перезагрузка событий после добавления
          setState(() {}); // Обновление состояния
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
