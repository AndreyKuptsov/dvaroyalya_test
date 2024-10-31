import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/event_model.dart';

class EventPieChart extends StatelessWidget {
  final EventModel event;

  EventPieChart(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Color(int.parse(event.colorCode)),
              value: eventDurationInHours(event),
              title: '', // Можно добавить время или процент
              radius: 25,
            ),
          ],
          centerSpaceRadius: 10,
          sectionsSpace: 1,
        ),
      ),
    );
  }

  // double eventDurationInHours(EventModel event) {
  //   return event.endTime.difference(event.startTime).inMinutes / 60;
  // }

  double eventDurationInHours(EventModel event) {
  final now = DateTime.now();
  
  // Преобразуем `startTime` и `endTime` в объекты `DateTime`
  final startDateTime = DateTime(now.year, now.month, now.day, event.startTime.hour, event.startTime.minute);
  final endDateTime = DateTime(now.year, now.month, now.day, event.endTime.hour, event.endTime.minute);

  // Вычисляем разницу в часах
  return endDateTime.difference(startDateTime).inMinutes / 60;
}

}
