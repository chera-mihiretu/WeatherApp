import 'package:geolocator/geolocator.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/cores/exceptions/exception_errors.dart';
import 'package:weather/features/location/data/model/location_model.dart';

class LoacationDataSource {
  Future<LocationModel> getCurrentLocation() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    if (locationEnabled) {
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission != LocationPermission.whileInUse &&
            locationPermission != LocationPermission.always) {
          throw LocationException(
              message: ExceptionErrors.locationPermissionNotGranted);
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          locationSettings: AndroidSettings(accuracy: LocationAccuracy.high));
      return LocationModel.fromPosition(position);
    } else {
      throw LocationException(message: ExceptionErrors.locationIsNotEnabled);
    }
  }
}
