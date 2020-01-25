import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/location_model.dart';

abstract class ILocationService {
  Future<List<Location>> fetchLocations(LocationListFilter filter);
}

class LocationService implements ILocationService {

  @override
  Future<List<Location>> fetchLocations(LocationListFilter filter) => Future.value([_getLocation()]);


  Location _getLocation() {
    Location location = Location();
    location.name = "test";
    return location;
  }
}
