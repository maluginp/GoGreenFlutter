class ResourcePage<T> {
  List<T> items;
  int count;

  ResourcePage({
    this.items,
    this.count = 0,
  });

  factory ResourcePage.fromJson(dynamic json, T Function(dynamic jsonItem) itemMapper) {
     List<dynamic> items = json["items"];

     return ResourcePage(
       items: items.map(itemMapper).toList(),
       count: json["count"]
     );
  }

  @override
  String toString() {
    return 'ResourcePage{items: $items, count: $count}';
  }


}

enum DocumentType {
  License, PrivacyPolicy
}