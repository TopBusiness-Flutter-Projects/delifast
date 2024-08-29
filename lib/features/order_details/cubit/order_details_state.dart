part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

class LoadinglogoNewImage extends OrderDetailsState {}

class LoadedlogoNewImage extends OrderDetailsState {}
class LoadingGetState  extends OrderDetailsState {}
class LoadedGetState  extends OrderDetailsState {}
class ErrorGetState  extends OrderDetailsState {}
class LoadingUpdateOrder  extends OrderDetailsState {}
class LoadedUpdateOrder  extends OrderDetailsState {}
class ErrorUpdateOrder  extends OrderDetailsState {}