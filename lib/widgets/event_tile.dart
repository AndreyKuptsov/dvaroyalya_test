import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventTile extends StatelessWidget {
  final EventModel event;

  EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(event.title),
      subtitle: Text('Time: ${event.startTime.format(context)} - ${event.endTime.format(context)}'),
      leading: CircleAvatar(backgroundColor: event.color),
    );
  }
}
