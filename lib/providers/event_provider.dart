// import 'package:flutter/material.dart';
// import '../models/event_model.dart';
// import '../services/database_helper.dart';

// class EventProvider extends ChangeNotifier {
//   List<EventModel> _events = [];

//   List<EventModel> get events => _events;

//   Future<void> fetchEvents() async {
//     _events = await DatabaseHelper.instance.getEvents();
//     notifyListeners();
//   }

//   Future<void> addEvent(EventModel event) async {
//     await DatabaseHelper.instance.insertEvent(event);
//     await fetchEvents();
//   }

//   Future<void> deleteEvent(int id) async {
//     await DatabaseHelper.instance.deleteEvent(id);
//     await fetchEvents();
//   }
// }


import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventProvider extends ChangeNotifier {
  final Map<DateTime, List<EventModel>> _events = {};

  List<EventModel> getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void addEvent(DateTime day, EventModel event) {
    if (_events[day] == null) {
      _events[day] = [];
    }
    _events[day]!.add(event);
    notifyListeners();
  }
}
