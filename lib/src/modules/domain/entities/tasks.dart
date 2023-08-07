class Tasks {
  int id;
  late String name;
  String description;
  String date;
  String time;
  int status;

  Tasks({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.status, 
  });

  factory Tasks.fromJson(Map<String, dynamic> json) {
    return Tasks(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'status': status,
    };
  }
}
