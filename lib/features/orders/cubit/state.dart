import 'package:delifast/core/models/get_states_model.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {}

class OrdersError extends OrdersState {}
//order states
class StatesLoading extends OrdersState {}
class StatesLoaded extends OrdersState {

}
class StatesError extends OrdersState {}
//