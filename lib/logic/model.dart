import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  
   String title;
   String date;
   String time;
   String status;
   String type;
  Task({
    required this.title,
    required this.date,
    required this.time,
    required this.status,
    required this.type,
  });

 
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'time': time,
      'status': status,
      'type': type,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      status: map['status'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
