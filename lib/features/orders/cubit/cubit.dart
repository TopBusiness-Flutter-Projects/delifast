import 'package:delifast/core/models/order_model.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:delifast/features/orders/cubit/state.dart';

import '../../../core/models/get_order_name.dart';
import '../../../core/utils/app_export.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.api) : super(OrdersInitial()) {
    getOrders(isFilter: false);
  }
  ServiceApi api;

  MainOrderModel? mainOrderModel;
  MainOrderModel? mainOrderModelFilter;
  Future getOrders({String? state, required bool isFilter}) async {
    emit(OrdersLoading());
    final result = await api.getOrders(state: state);
    result.fold(
      (failure) {
        emit(OrdersError());
      },
      (r) {
        if (isFilter == false) {
          mainOrderModel = r;

          for (int i = 0; i < r.result!.length; i++) {
            getOrderNameCategory(r.result![i].categoryId.toString(), i,
                isFilter: isFilter);
            getStateOfOrder(r.result![i].stateId.toString(), i,
                isFilter: isFilter);
            getNameOfOrder(i, r.result![i].courierLines ?? [],
                isFilter: isFilter);
          }
        } else {
          mainOrderModelFilter = r;
          for (int i = 0; i < r.result!.length; i++) {
            getOrderNameCategory(r.result![i].categoryId.toString(), i,
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

      return GetOrderNameModel(name: '');
    }, (r) {
      if (isFilter == false) {
        mainOrderModel?.result?[index ?? 0].currentNameOfCategory = r.name;
      } else {
        mainOrderModelFilter?.result?[index ?? 0].currentNameOfCategory =
            r.name;
      }

      emit(SuccessGetName());
      return r;
    });
  }

  getStateOfOrder(String id, int? index, {required bool isFilter}) async {
    emit(Loading2GetName());
    var res = await api.getStateOfOrder(id);

    res.fold((l) {
      emit(Error2GetName());

      return GetOrderNameModel(name: '');
    }, (r) {
      if (isFilter == false) {
        mainOrderModel?.result?[index ?? 0].stateName = r.name;
      } else {
        mainOrderModelFilter?.result?[index ?? 0].stateName = r.name;
      }
      emit(Success2GetName());
      return r;
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
    required String searchKey,
  }) async {
    searchedproductsModel = MainOrderModel();
    final response = await api.searchOrder(searchKey: searchKey);
    response.fold((l) => emit(AllProductsFailureState()), (r) {
      if (r.result!.isEmpty) {
        errorGetBar("لا يوجد نتائج");
      } else {
        searchedproductsModel = r;
        Navigator.pushNamed(contexttt, Routes.ordersRoutes);
      }
      emit(AllProductsSuccessState());
    });
  }
}
