import 'package:delifast/core/models/order_model.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:delifast/features/orders/cubit/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/get_count_order.dart';
import '../../../core/models/get_states_model.dart';
import '../../../core/utils/app_export.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.api) : super(OrdersInitial()) {
    getOrders();
  }
  ServiceApi api;

  MainOrderModel? mainOrderModel;
  MainOrderModel? mainOrderModelFilter;
  GetStatesModel? getStatesModel;
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
//   searchProducts({
// required  BuildContext? contexttt,
//     required String searchKey,
//   }) async {
//     searchedproductsModel = MainOrderModel();
//     final response = await api.searchOrder( searchKey: searchKey);
//     response.fold((l) => emit(AllProductsFailureState()), (r) {
//        if( r.result!.isEmpty){
//          errorGetBar("لا يوجد نتائج");
//        }else{
//          searchedproductsModel = r;
//          Navigator.pushNamed(contexttt, Routes.ordersRoutes);
//        }
//       emit(AllProductsSuccessState());
//     });
//   }
  int allOrderCount =0;
  Future getStates() async {
    print("loading");
    emit(StatesLoading());
    final response = await api.getStates();
    response.fold((l) {
      emit(StatesError());
    }, (r) async {
      getStatesModel = r;
      allOrderCount = await getAllOrdersCount() ??0;
      if (getStatesModel?.result != null) {
        for (var item in getStatesModel!.result!) {
         // int countt = await getOrderCount(item.id ?? 0); // Handling nullable int
          item.count = await getOrderCount(item.id!); // Assuming `count` is a field in your model where you want to store the total count
        }
      }
      emit(StatesLoaded());
    });
  }

//get count

  Future<int>? getOrderCount(int id) async {
    print("loading");
    emit(StatesLoading());
    int totalCount = 0;
    final response = await api.getOrderCount(id: id);

    response.fold((l) {

      emit(StatesError());


    }, (r) {
     // getStatesModel = r;
       totalCount = r.totalPages ?? 0;

      emit(StatesLoaded());
    });
return totalCount;
  }
  GetCountOrder?getCountOrder;
  //get all orders count
  Future<int>? getAllOrdersCount() async {
    print("loading");
    emit(StatesLoading());
    int totalCount = 0;
    final response = await api.getAllOrdersCount();

    response.fold((l) {
      emit(StatesError());
    }, (r) {
      // getStatesModel = r;
      totalCount = r.totalPages ?? 0;

      emit(StatesLoaded());
    });
    return totalCount;
  }



}
