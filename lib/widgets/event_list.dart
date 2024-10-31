import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../models/event_model.dart';
import '../providers/event_provider.dart';

class EventList extends StatelessWidget {
  final DateTime? selectedDay;

  EventList({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).getEventsForDay(selectedDay ?? DateTime.now());

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(events[index].title),
          subtitle: Text('${events[index].startTime} - ${events[index].endTime}'),
          leading: CircleAvatar(
            backgroundColor: events[index].color,
          ),
        );
      },
    );
  }
}
