import 'package:delifast/core/models/order_model.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:delifast/features/orders/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/get_order_name.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.api) : super(OrdersInitial()) {
    getOrders();
  }
  ServiceApi api;

  MainOrderModel? mainOrderModel;
  MainOrderModel? mainOrderModelFilter;
  Future getOrders({String? state}) async {
    emit(OrdersLoading());
    final result = await api.getOrders(state: state);
    result.fold(
      (failure) {
        emit(OrdersError());
      },
      (r) {
        if (state == null) {
          mainOrderModel = r;
        } else {
          mainOrderModelFilter = r;

          state = null;
        }

        emit(OrdersSuccess());
      },
    );
  }

  String? name;
  getOrderName(String id, int? index) async {
    var res = await api.getNameOfOrder(id);

    res.fold((l) {
      return GetOrderNameModel(name: '');
    }, (r) {
      mainOrderModel == null
          ? null
          : mainOrderModel?.result?[index ?? 0].currentName = r.name;
      mainOrderModelFilter == null
          ? null
          : mainOrderModelFilter?.result?[index ?? 0].currentName = r.name;
      return r;
    });
  }
}
