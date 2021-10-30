class Course {
  int _id;
  String _name;
  String _decribtion;
  int _hours;
  Course(dynamic obj) {
    _id = obj["id"];
    _name = obj["name"];
    _decribtion = obj["decribtion"];
    _hours = obj["hours"];
  }
  Course.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _name = data["name"];
    _decribtion = data["decribtion"];
    _hours = data["hours"];
  }
  Map<String, dynamic> toMap() =>
      {'id': _id, 'name': _name, 'decribtion': _decribtion, 'hours': _hours};

  int get id => _id;
  String get name => _name;
  String get decribtion => _decribtion;
  int get hours => _hours;
}
