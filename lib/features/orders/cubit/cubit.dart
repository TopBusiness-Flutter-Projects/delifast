import 'package:delifast/core/models/order_model.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:delifast/features/orders/cubit/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_export.dart';

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
  //get search
  TextEditingController searchController = TextEditingController();
  MainOrderModel searchedproductsModel = MainOrderModel();
  searchProducts({
required  BuildContext? contexttt,
    required String searchKey,
  }) async {
    searchedproductsModel = MainOrderModel();
    final response = await api.searchOrder( searchKey: searchKey);
    response.fold((l) => emit(AllProductsFailureState()), (r) {
       if( r.result!.isEmpty){
         errorGetBar("لا يوجد نتائج");
       }else{
         searchedproductsModel = r;
         Navigator.pushNamed(contexttt, Routes.ordersRoutes);
       }
      emit(AllProductsSuccessState());
    });
  }

}
