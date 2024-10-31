// class EventModel {
//   final int? id;
//   final String title;
//   final DateTime startTime;
//   final DateTime endTime;
//   final String colorCode;

//   EventModel({
//     this.id,
//     required this.title,
//     required this.startTime,
//     required this.endTime,
//     required this.colorCode,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'startTime': startTime.toIso8601String(),
//       'endTime': endTime.toIso8601String(),
//       'colorCode': colorCode,
//     };
//   }

//   static EventModel fromMap(Map<String, dynamic> map) {
//     return EventModel(
//       id: map['id'],
//       title: map['title'],
//       startTime: DateTime.parse(map['startTime']),
//       endTime: DateTime.parse(map['endTime']),
//       colorCode: map['colorCode'],
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class EventModel {
//   final String title;
//   final TimeOfDay startTime;
//   final TimeOfDay endTime;
//   final Color color;

//   EventModel({
//     required this.title,
//     required this.startTime,
//     required this.endTime,
//     required this.color,
//   });
// }


// import 'package:flutter/material.dart';

// class EventModel {
//   final String title;
//   final TimeOfDay startTime;
//   final TimeOfDay endTime;
//   final Color color;

//   EventModel({
//     required this.title,
//     required this.startTime,
//     required this.endTime,
//     required this.color,
//   });

//   /// Преобразуем цвет в строковый код для сохранения в базу данных
//   String get colorCode => color.value.toRadixString(16);

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'startTime': '${startTime.hour}:${startTime.minute}',
//       'endTime': '${endTime.hour}:${endTime.minute}',
//       'colorCode': colorCode,
//     };
//   }

//   factory EventModel.fromMap(Map<String, dynamic> map) {
//     final startTimeParts = map['startTime'].split(':');
//     final endTimeParts = map['endTime'].split(':');
//     return EventModel(
//       title: map['title'],
//       startTime: TimeOfDay(
//         hour: int.parse(startTimeParts[0]),
//         minute: int.parse(startTimeParts[1]),
//       ),
//       endTime: TimeOfDay(
//         hour: int.parse(endTimeParts[0]),
//         minute: int.parse(endTimeParts[1]),
//       ),
//       color: Color(int.parse(map['colorCode'], radix: 16)),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class EventModel {
//   final String title;
//   final TimeOfDay startTime;
//   final TimeOfDay endTime;
//   final Color color;

//   EventModel({
//     required this.title,
//     required this.startTime,
//     required this.endTime,
//     required this.color,
//   });

//   String get colorCode => color.value.toRadixString(16);

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'startTime': '${startTime.hour}:${startTime.minute}',
//       'endTime': '${endTime.hour}:${endTime.minute}',
//       'colorCode': colorCode,
//     };
//   }

//   factory EventModel.fromMap(Map<String, dynamic> map) {
//     final startTimeParts = map['startTime'].split(':');
//     final endTimeParts = map['endTime'].split(':');
//     return EventModel(
//       title: map['title'],
//       startTime: TimeOfDay(
//         hour: int.parse(startTimeParts[0]),
//         minute: int.parse(startTimeParts[1]),
//       ),
//       endTime: TimeOfDay(
//         hour: int.parse(endTimeParts[0]),
//         minute: int.parse(endTimeParts[1]),
//       ),
//       color: Color(int.parse(map['colorCode'], radix: 16)),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class EventModel {
//   final String title;          // Название события
//   final TimeOfDay startTime;  // Время начала события
//   final TimeOfDay endTime;    // Время окончания события
//   final Color color;          // Цвет события

//   EventModel({
//     required this.title,
//     required this.startTime,
//     required this.endTime,
//     required this.color,
//   });

//   // Метод для получения цвета в формате строки (hex)
//   String get colorCode => color.value.toRadixString(16).padLeft(8, '0'); // Убедитесь, что код цвета всегда 8 символов

//   // Метод для преобразования модели события в карту для хранения
//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'startTime': '${startTime.hour}:${startTime.minute}', // Форматирование времени
//       'endTime': '${endTime.hour}:${endTime.minute}',
//       'colorCode': colorCode,
//     };
//   }

//   // Фабричный метод для создания экземпляра EventModel из карты
//   factory EventModel.fromMap(Map<String, dynamic> map) {
//     // Разделение времени начала и окончания
//     final startTimeParts = map['startTime'].split(':');
//     final endTimeParts = map['endTime'].split(':');

//     return EventModel(
//       title: map['title'],
//       startTime: TimeOfDay(
//         hour: int.parse(startTimeParts[0]),   // Преобразование часов в int
//         minute: int.parse(startTimeParts[1]), // Преобразование минут в int
//       ),
//       endTime: TimeOfDay(
//         hour: int.parse(endTimeParts[0]),
//         minute: int.parse(endTimeParts[1]),
//       ),
//       // Преобразование кода цвета обратно в Color
//       color: Color(int.parse(map['colorCode'], radix: 16) | 0xFF000000), // Обеспечиваем наличие альфа-канала
//     );
//   }

//   get id => null;
// }


// import 'package:flutter/material.dart';

// class EventModel {
//   final String title;
//   final TimeOfDay startTime;
//   final TimeOfDay endTime;
//   final Color color;

//   EventModel({
//     required this.title,
//     required this.startTime,
//     required this.endTime,
//     required this.color,
//   });

//   String get colorCode => color.value.toRadixString(16);

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'startTime': '${startTime.hour}:${startTime.minute}',
//       'endTime': '${endTime.hour}:${endTime.minute}',
//       'colorCode': colorCode,
//     };
//   }

//   factory EventModel.fromMap(Map<String, dynamic> map) {
//     final startTimeParts = map['startTime'].split(':');
//     final endTimeParts = map['endTime'].split(':');

//     if (startTimeParts.length < 2 || endTimeParts.length < 2) {
//       throw FormatException("Invalid time format");
//     }

//     return EventModel(
//       title: map['title'],
//       startTime: TimeOfDay(
//         hour: int.tryParse(startTimeParts[0]) ?? 0,
//         minute: int.tryParse(startTimeParts[1]) ?? 0,
//       ),
//       endTime: TimeOfDay(
//         hour: int.tryParse(endTimeParts[0]) ?? 0,
//         minute: int.tryParse(endTimeParts[1]) ?? 0,
//       ),
//       color: Color(int.parse(map['colorCode'], radix: 16)),
//     );
//   }

//   get id => null;
// }


import 'package:flutter/material.dart';

class EventModel {
  final int? id; // Добавьте это поле
  final String title;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;

  EventModel({
    this.id, // Убедитесь, что id может быть null для новых событий
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.color,
  });

  String get colorCode => color.value.toRadixString(16).padLeft(8, '0'); // Убедитесь, что строка имеет 8 символов

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Добавьте id в метод toMap
      'title': title,
      'startTime': '${startTime.hour}:${startTime.minute}',
      'endTime': '${endTime.hour}:${endTime.minute}',
      'colorCode': colorCode,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    final startTimeParts = map['startTime'].split(':');
    final endTimeParts = map['endTime'].split(':');

    return EventModel(
      id: map['id'], // Получите id из мапы
      title: map['title'],
      startTime: TimeOfDay(
        hour: int.parse(startTimeParts[0]),
        minute: int.parse(startTimeParts[1]),
      ),
      endTime: TimeOfDay(
        hour: int.parse(endTimeParts[0]),
        minute: int.parse(endTimeParts[1]),
      ),
      color: Color(int.parse(map['colorCode'], radix: 16)),
    );
  }
}
