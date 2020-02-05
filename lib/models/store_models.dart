class Store {
  String guid;
  String name;
}

class Good {
  String guid;
  String name;
  String image;
  double price;
}

class Department {
  String guid;
  String name;
  String image;
}

class SubDepartmentGood extends Good {

}

class Modifier {
  String guid;
  String name;
  List<Option> options;
}

class Option {
  String guid;
  String name;
  double price;
}

class Service {
  String name;
}