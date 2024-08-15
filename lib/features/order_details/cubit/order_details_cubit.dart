import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'order_details_state.dart';
//
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
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
}
