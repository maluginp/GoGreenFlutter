class Location {
  String name;

  Location({
    this.name,
  });

  factory Location.fromJson(dynamic json) {
    return Location(
      name: json['name']
    );
  }
}
