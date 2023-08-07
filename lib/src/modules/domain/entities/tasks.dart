class Tasks {
  int id;
  String name;
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
    required this.status, required title,
  });

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
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
