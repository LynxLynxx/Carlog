import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  FirebaseAuth,
  // AuthRepository,
  CarRepository,
])
void main() {}
