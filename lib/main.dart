// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/event_provider.dart';
// import 'screens/calendar_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => EventProvider(),
//       child: MaterialApp(
//         home: CalendarScreen(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'screens/calendar_screen.dart';
// import 'providers/event_provider.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => EventProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Календарь',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CalendarScreen(),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
