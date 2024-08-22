import 'package:carlog/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocationRepository {
  const LocationRepository();

  Future<Either<Failure, Placemark>> getLocationFromCoordinates(
      double latitude, double longitude) async {
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      return Right(placemarks.first);
    } catch (error) {
      return Left(UnknownFailure.undefined(message: error.toString()));
    }
  }

  Future<Either<Failure, Location>> getCoordinatesFromLocation(
      String location) async {
    try {
      final List<Location> locations = await locationFromAddress(location);
      return Right(locations.first);
    } catch (error) {
      return Left(UnknownFailure.undefined(message: error.toString()));
    }
  }
}
