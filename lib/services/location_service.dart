import 'dart:convert';

import 'package:gogreen/core/http.dart';
import 'package:gogreen/models/common_models.dart';
import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/location_model.dart';

abstract class ILocationService {
  Future<List<Location>> fetchLocations(LocationListFilter filter, int page);
}

class LocationService implements ILocationService {
  final DenovoHttpClient _denovoHttpClient;
  static const int ITEMS_ON_PAGE = 10;

  LocationService(this._denovoHttpClient);

  @override
  Future<List<Location>> fetchLocations(
      LocationListFilter filter, int page) async {
    if (page <= 0) {
      throw Exception("page must be great than 0, current=$page");
    }

    var response = await _denovoHttpClient.getWithArgs(
      "api/consumers/locations",
      query: {
        "take": ITEMS_ON_PAGE,
        "skip": ITEMS_ON_PAGE * (page - 1),
      },
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var resource = ResourcePage.fromJson(body, (i) => Location.fromJson(i));
      print("Resource $resource");
      return resource.items;
    }

    return [];
  }
}
