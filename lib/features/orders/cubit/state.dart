abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {}

class OrdersError extends OrdersState {}

//order states
class StatesLoading extends OrdersState {}

class StatesLoaded extends OrdersState {}

class SuccessGetName extends OrdersState {}

class LoadingGetName extends OrdersState {}

class ErrorGetName extends OrdersState {}

class Success2GetName extends OrdersState {}

class Loading2GetName extends OrdersState {}

class Error2GetName extends OrdersState {}

class Success3GetName extends OrdersState {}

class Loading3GetName extends OrdersState {}

class Error3GetName extends OrdersState {}

class AllProductsFailureState extends OrdersState {}

class AllProductsSuccessState extends OrdersState {}

class SuccessGetSearchOrder extends OrdersState {}

class Success3GetSearchOrder extends OrdersState {}

class Success2GetSearchOrder extends OrdersState {}

class StatesError extends OrdersState {}
//
