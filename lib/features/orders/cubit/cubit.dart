import 'package:delifast/core/models/order_model.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:delifast/features/orders/cubit/state.dart';

import '../../../core/models/get_count_order.dart';
import '../../../core/models/get_order_name.dart';
import '../../../core/models/get_states_model.dart';
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
    final response =
        await api.searchOrder(searchKey: 'COURIER/${searchController.text}');
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

  GetStatesModel? getStatesModel;
  int allOrderCount = 0;
  Future getStates() async {
    print("loading");
    emit(StatesLoading());
    final response = await api.getStates();
    response.fold((l) {
      emit(StatesError());
    }, (r) async {
      getStatesModel = r;
      allOrderCount = await getAllOrdersCount() ?? 0;
      if (getStatesModel?.result != null) {
        for (var item in getStatesModel!.result!) {
          // int countt = await getOrderCount(item.id ?? 0); // Handling nullable int
          item.count = await getOrderCount(item
              .id!); // Assuming count is a field in your model where you want to store the total count
        }
      }
      emit(StatesLoaded());
    });
  }

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

  GetCountOrder? getCountOrder;
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
