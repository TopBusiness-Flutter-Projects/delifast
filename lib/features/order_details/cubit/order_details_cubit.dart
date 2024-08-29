import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:delifast/core/utils/app_export.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../core/models/main_state_model.dart';
import '../../orders/cubit/cubit.dart';

part 'order_details_state.dart';

//
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.api) : super(OrderDetailsInitial());

  ServiceApi api;
  File? selectedImage;
  Future pickLogoImage() async {
    emit(LoadinglogoNewImage());
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      selectedImage = await imageTemporary;
      print('............${selectedImage?.path}');
      emit(LoadedlogoNewImage());
    } on PlatformException catch (e) {
      print('error $e');
    }
  }

  MainStateModel? states;
  getStateOfOrderDetails() async {
    emit(LoadingGetState());
    final res = await api.getStateOfOrderDetails();

    res.fold((l) {
      emit(ErrorGetState());
    }, (r) {
      states = r;
      emit(LoadedGetState());
    });
  }

  String selectedStatus = 'New';

  updateOrder(
      String orderId, String date, int stateId, BuildContext context) async {
    emit(LoadingUpdateOrder());

    final res =
        await api.updateOrder(orderId: orderId, date: date, stateId: stateId);

    res.fold((l) {
      emit(ErrorUpdateOrder());
    }, (r) {
      Navigator.pop(context);

      context.read<OrdersCubit>().getOrders(isFilter: false);

      emit(LoadedUpdateOrder());
    });
  }
}
