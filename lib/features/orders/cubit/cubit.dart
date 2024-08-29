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

          for (int i = 0; i < r.result!.length; i++) {
            getOrderNameCategory(
                r.result![i].categoryId == false
                    ? ''
                    : r.result![i].categoryId.toString(),
                i,
                isFilter: isFilter);
            getStateOfOrder(r.result![i].stateId.toString(), i,
                isFilter: isFilter);
            getNameOfOrder(i, r.result![i].courierLines ?? [],
                isFilter: isFilter);
          }
        } else {
          mainOrderModelFilter = r;
          for (int i = 0; i < r.result!.length; i++) {
            getOrderNameCategory(
                r.result![i].categoryId == false
                    ? ''
                    : r.result![i].categoryId.toString(),
                i,
                isFilter: isFilter);
            getStateOfOrder(r.result![i].stateId.toString(), i,
                isFilter: isFilter);
            getNameOfOrder(i, r.result![i].courierLines ?? [],
                isFilter: isFilter);
          }
        }

        emit(OrdersSuccess());
      },
    );
  }

  getOrderNameCategory(String id, int? index, {required bool isFilter}) async {
    emit(LoadingGetName());
    var res = await api.getCategoryNameOfOrder(id);

    res.fold((l) {
      emit(ErrorGetName());

      GetOrderNameModel(name: '');
    }, (r) {
      if (isFilter == false) {
        mainOrderModel?.result?[index ?? 0].currentNameOfCategory =
            r.name ?? 'other category';
      } else {
        mainOrderModelFilter?.result?[index ?? 0].currentNameOfCategory =
            r.name ?? 'other category';
      }

      emit(SuccessGetName());
    });
  }

  getStateOfOrder(String id, int? index, {required bool isFilter}) async {
    emit(Loading2GetName());
    var res = await api.getStateOfOrder(id);

    res.fold((l) {
      emit(Error2GetName());
      GetOrderNameModel(name: '');
    }, (r) {
      if (isFilter == false) {
        mainOrderModel?.result?[index ?? 0].stateName = r.name;
      } else {
        mainOrderModelFilter?.result?[index ?? 0].stateName = r.name;
      }
      emit(Success2GetName());
      // return r;
    });
  }

  getNameOfOrder(int index, List data, {required bool isFilter}) async {
    emit(Loading3GetName());

    for (int i = 0; i < data.length; i++) {
      final res = await api.getNamesOfOrder(
          mainOrderModel!.result?[index].courierLines?[i].toString() ?? '1');
      res.fold((l) {
        emit(Error3GetName());
      }, (r) {
        if (mainOrderModel != null &&
            isFilter == false &&
            mainOrderModel?.result != []) {
          mainOrderModel!.result?[index].orderName = '';

          mainOrderModel!.result?[index].orderName = '';
          mainOrderModel!.result?[index].orderName += '${r.name ?? ''}, ';
        }
        if (mainOrderModelFilter != null &&
            isFilter == true &&
            mainOrderModelFilter?.result != []) {
          mainOrderModelFilter!.result?[index].orderName = '';

          mainOrderModelFilter?.result?[index].orderName += '${r.name ?? ''}, ';
        }

        emit(Success3GetName());
      });
    }
  }

  //get search
  TextEditingController searchController = TextEditingController();
  MainOrderModel searchedproductsModel = MainOrderModel();
  searchProducts({
    required BuildContext contexttt,
  }) async {
    searchedproductsModel = MainOrderModel();
    final response = await api.searchOrder(searchKey: searchController.text);
    response.fold((l) => emit(AllProductsFailureState()), (r) {
      if (r.result!.isEmpty) {
        errorGetBar("لا يوجد نتائج");
      } else {
        searchedproductsModel = r;
        if (r.result!.isNotEmpty) {
          OrderModel? model = r.result!.first;
          //! get order name

          for (int i = 0; i < model.courierLines!.length; i++) {
            api
                .getNamesOfOrder(model.courierLines?[i].toString() ?? '1')
                .then((e) {
              e.fold((l) {}, (r) {
                model.orderName += '${r.name ?? ''},';
                emit(Success3GetSearchOrder());
              });
            });
          }
          //! get category name
          api.getCategoryNameOfOrder(model.categoryId.toString()).then((e) {
            e.fold((l) {}, (r) {
              model.currentNameOfCategory = r.name ?? 'other category';
              emit(Success2GetSearchOrder());
            });
          });
          api.getStateOfOrder(model.stateId.toString()).then((e) {
            e.fold((l) {}, (r) {
              model.stateName = r.name ?? '';
              emit(SuccessGetSearchOrder());
            });
          });

          Navigator.pushNamed(contexttt, Routes.ordersDetailsRoutes,
              arguments: model);
          print(
              'dddddddddd ${model.stateName} : ${model.orderName} : ${model.currentNameOfCategory} ');
        } else {
          errorGetBar("لا يوجد نتائج");
        }
      }
      emit(AllProductsSuccessState());
    });
  }
}
