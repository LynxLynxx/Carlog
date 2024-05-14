part of 'cars_bloc.dart';

abstract class CarsState extends Equatable {
  const CarsState();  

  @override
  List<Object> get props => [];
}
class CarsInitial extends CarsState {}
