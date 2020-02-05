import 'dart:convert';

import 'package:gogreen/core/http.dart';
import 'package:gogreen/models/common_models.dart';
import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/location_model.dart';

abstract class ILocationService {
  Future<List<Location>> fetchLocations(LocationListFilter filter);
}

class LocationService implements ILocationService {

  final DenovoHttpClient _denovoHttpClient;

  LocationService(this._denovoHttpClient);

  @override
  Future<List<Location>> fetchLocations(LocationListFilter filter) async {
    var response = await _denovoHttpClient.get("api/consumers/locations");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var resource = ResourcePage.fromJson(body, (i) => Location.fromJson(i));
      return resource.items;
    }

    return [];
  }
}
