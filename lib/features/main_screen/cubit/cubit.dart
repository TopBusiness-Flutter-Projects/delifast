import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/core/remote/service.dart';

import '../../orders/cubit/cubit.dart';
import 'state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.api) : super(MainInitial());

  ServiceApi api;

  int selectedIndex = 0; // State variable to track the selected index

  void onItemTapped(int index, BuildContext context) {
    selectedIndex = index;
    emit(OnChnageCurrentIndex());
    if (index == 0 || index == 1) {
      context.read<OrdersCubit>().getOrders(isFilter: false);
    }
  }
}
