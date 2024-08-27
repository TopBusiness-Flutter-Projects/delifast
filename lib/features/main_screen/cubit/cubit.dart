import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delifast/core/remote/service.dart';

import 'state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.api) : super(MainInitial());

  ServiceApi api;



  int selectedIndex = 0; // State variable to track the selected index

  void onItemTapped(int index) {
      selectedIndex = index;
      emit(OnChnageCurrentIndex());
  }
}
