part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}
class LoadinglogoNewImage extends OrderDetailsState {}
class LoadedlogoNewImage extends OrderDetailsState {}
