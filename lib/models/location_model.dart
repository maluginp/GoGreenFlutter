class Location {
  int id;
  String name;

  Location({
    this.id,
    this.name,
  });

  factory Location.fromJson(dynamic json) {
    return Location(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'Location{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Location &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode;




}
