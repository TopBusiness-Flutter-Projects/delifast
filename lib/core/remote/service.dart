// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, unnecessary_brace_in_string_interps

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/login_model.dart';
import '../models/order_model.dart';
import '../preferences/preferences.dart';

class ServiceApi {
  final BaseApiConsumer dio;
  ServiceApi(this.dio);

  Future<String> getSessionId({String? baseUrl, String? database}) async {
    try {
      final odoo = OdooClient(baseUrl ?? EndPoints.baseUrl);
      final odoResponse =
          await odoo.authenticate(database ?? EndPoints.db, "admin", "admin");

      ///! a250de4222bacb0355f3bee5df6efa04542c5549
      final sessionId = odoResponse.id;
      print("getSessionId = $sessionId");
      await Preferences.instance.setSessionId(sessionId);
      return sessionId;
    } on OdooException catch (e) {
      print("dddddddddddddd" + e.message);
      return "error";
      // return Future.error(ServerFailure(message: e.message));
    }
  }

  Future<Either<ServerFailure, AuthModel>> login(
      String phoneOrMail, String password) async {
    String sessionIddd = await getSessionId();
    if (sessionIddd == 'error') {
      return Left(ServerFailure(message: "server_error".tr()));
    } else {
      try {
        final response = await dio.post(
          EndPoints.auth,
          options: Options(
            headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionIddd"},
          ),
          body: {
            "params": {
              'login': phoneOrMail,
              "password": password,
              "db": EndPoints.db
            },
          },
        );
        return Right(AuthModel.fromJson(response));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  Future<Either<Failure, MainOrderModel>> getOrders({String? state}) async {
    print(EndPoints.ordersUrl +
        (state != null
            ? ('filter=[["user_id", "=", 12],["state_id", "=", "New"]]&query={id,name,sender_street,sender_mobile,receiver_street,receiver_mobile,total_charge_amount,notes,courier_lines,state_id}')
            : ('filter=[["user_id", "=", 12]]&query={id,name,sender_street,sender_mobile,receiver_street,receiver_mobile,total_charge_amount,notes,courier_lines,state_id,category_id}')));
    try {
      // String userId = await Preferences.instance.getUserId() ?? "1";
      // print("lllllllllll${userId}");

      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.ordersUrl +
            (state != null
                ? ('filter=[["user_id", "=", 12],["state_id", "=", "${state}"]]&query={id,name,sender_street,sender_mobile,receiver_street,receiver_mobile,total_charge_amount,notes,courier_lines,state_id}')
                : ('filter=[["user_id", "=", 12]]&query={id,name,sender_street,sender_mobile,receiver_street,receiver_mobile,total_charge_amount,notes,courier_lines,state_id,category_id}')),
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=a8af99171ec4c7e7afef224de8fef6a2080b74b7"},
        ),
      );
      return Right(MainOrderModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//   Future<Either<ServerFailure, DefaultModel>> register(
//       {required String phoneOrMail,
//       required String name,
//       required String password}) async {
//     String sessionIddd = await getSessionId(phone: "admin", password: "admin");
//     if (sessionIddd == 'error') {
//       return Left(ServerFailure(message: "server_error".tr()));
//     } else {
//       try {
//         final response = await dio.post(
//           EndPoints.register,
//           options: Options(
//             headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionIddd"},
//           ),
//           body: {
//             "params": {
//               "data": {
//                 "name": name,
//                 "login": phoneOrMail,
//                 "password": password,
//                 "sel_groups_1_9_10": 1,
//                 "user_type": "client"
//               }
//             },
//           },
//         );
//         return Right(DefaultModel.fromJson(response));
//       } on ServerException catch (e) {
//         return Left(ServerFailure(message: e.toString()));
//       }
//     }
//   }

//   Future<Either<Failure, DefaultModel>> updatePartner({
//     required int userId,
//     required String image,
//     required String address,
//     required String mobile,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.put(EndPoints.updatePartner,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "filter": [
//                 [
//                   "user_ids",
//                   "=",
//                   [userId]
//                 ]
//               ],
//               "data": {
//                 "image_medium": "", //base_64
//                 "mobile": "$mobile",
//                 "street": address
//               }
//             }
//           });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     }
//   }

//   Future<Either<Failure, DefaultModel>> updateProfile({
//     required String image,
//     //required String address,
//     required String mobile,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     String userId = await Preferences.instance.getUserId() ?? "1";
//     try {
//       final response = await dio.put(EndPoints.updatePartner,
//           options: Options(
//             headers: {
//               "Cookie": "session_id=3ffb870cac23ecc333fe57c3248dc7c8ebbcad47"
//             },
//           ),
//           body: {
//             "params": {
//               "filter": [
//                 [
//                   "user_ids",
//                   "=",
//                   [userId]
//                 ]
//               ],
//               "data": {
//                 "image_medium": image, //base_64
//                 "mobile": "$mobile"
//               }
//             }
//           });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     }
//   }

// //// Home

// /////////////////////////////////////////
//   Future<Either<Failure, AllCategoriesModel>> getAllCategories() async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.allCategoriesUrl,
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );

//       return Right(AllCategoriesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, AllProductsModel>> getAllProducts(int page) async {
//     try {
//       // String? sessionId = '135b0fdbcf1b433641f448914ed5015d84a5c903';
//       String? sessionId = await Preferences.instance.getSessionId();

//       final response = await dio.get(
//         EndPoints.allProducts +
//             '?filter=[["is_service_app","=","true"]]&query={id,categ_id,name,list_price,image_1920}&page_size=10&limit=10&page=$page',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       print("lllllllllllll" + response.toString());
//       return Right(AllProductsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, AllProductsModel>> getAllProductsPrices(
//       int page, bool isWithPrice) async {
//     try {
//       String priceMark = "=";
//       if (isWithPrice) {
//         priceMark = "!=";
//       }
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.allProducts +
//             '?filter=[["is_service_app","=","true"],["list_price", "$priceMark","0.0"]]&query={id,categ_id,name,list_price,image_1920}&page_size=10&limit=10&page=$page',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       print("lllllllllllll" + response.toString());
//       return Right(AllProductsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, AllProductsModel>> searchProducts(
//       int page, String name) async {
//     try {
//       // String? sessionId = '135b0fdbcf1b433641f448914ed5015d84a5c903';
//       String? sessionId = await Preferences.instance.getSessionId();

//       final response = await dio.get(
//         EndPoints.allProducts +
//             '?filter=[["is_service_app","=","true"],["name", "=like", "%$name%"]]&query={id,categ_id,name,list_price,image_1920}&page_size=10&limit=10&page=$page',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       print("lllllllllllll" + response.toString());
//       return Right(AllProductsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, AllProductsModel>> getAllProductsByCategory(
//       {required int categoryId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.allCategoryProducts,
//         queryParameters: {
//           'filter': '[["categ_id", "=", [$categoryId]]]',
//           'query': '{id,categ_id,name,list_price,image_1920}'
//         },
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );

//       return Right(AllProductsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }//
//
//   Future<Either<Failure, HomeModel>> homeData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//   }

//   Future<Either<Failure, GetOffersModel>> getOffers({int? offerId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         offerId != null
//             ? EndPoints.getOffers + '&filter=[["id","!=",$offerId]]'
//             : EndPoints.getOffers,
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetOffersModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetAllProviderModel>> getProviders(
//       // int page, int pageSize
//       ) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getProviders,
//         //+'&page_size=$pageSize&page=$page',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetAllProviderModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetProviderDetailsModel>> getProviderDetails(
//       {required int providerId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getProviderDetails +
//             '/$providerId?query={id, name,partner_id,image_1920,login,level,specialization_id,partner_latitude,partner_longitude}&filter=[["user_type","=","provider"]]',
//         //+'&page_size=$pageSize&page=$page',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetProviderDetailsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetProviderRatesModel>> getProviderRates(
//       {required int providerId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getProviderRates +
//             '?query={create_date,number_of_stars,review_msg,client_id}&filter=[["provider_id","=",$providerId]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetProviderRatesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, DefaultModel>> rateTechnicians({
//     required int technicianId,
//     required String comment,
//     required double rate,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     String userId = await Preferences.instance.getUserId() ?? "1";

//     try {
//       final response = await dio.post(EndPoints.getProviderRates,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "data": {
//                 "client_id": int.parse(userId),
//                 "provider_id": technicianId,
//                 "number_of_stars": rate,
//                 "review_msg": comment.isEmpty ? " " : comment
//               }
//             }
//           }).onError((error, stackTrace) {
//         print(error.toString());
//       });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetAllProviderModel>> getProvidersWithFilters(
//       {required String level, required String categoryId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         level == "all"
//             ? EndPoints.getProvidersWithFilters +
//                 'filter=[["user_type","=","provider"],["specialization_id","=",$categoryId]]'
//             : EndPoints.getProvidersWithFilters +
//                 'filter=[["user_type","=","provider"],["level","=","$level"],["specialization_id","=",$categoryId]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetAllProviderModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetProviderDetailsModel>> getClientDetails(
//       {required int clientId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getProviderDetails +
//             '/$clientId?query={name,image_1920}&filter=[["user_type","=","client"]]',
//         //+'&page_size=$pageSize&page=$page',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetProviderDetailsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   /// ADD SERVICE
//   Future<Either<Failure, DefaultModel>> addService({
//     required String categoryId,
//     required String serviceId,
//     required String providerId,
//     required String level,
//     double? servicePrice,
//     // required String totalPrice,
//     required int qty,
//     required String date,
//     required List<String> images,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     String userId = await Preferences.instance.getUserId() ?? "1";
//     print(images);
//     try {
//       final response = await dio
//           .post(EndPoints.order,
//               options: Options(
//                 headers: {"Cookie": "session_id=$sessionId"},
//               ),
//               body: servicePrice == null
//                   ? {
//                       "params": {
//                         "data": {
//                           "client_id": int.parse(userId),
//                           "category_id": int.parse(categoryId), //sebaka
//                           "service_id": int.parse(serviceId), // tarkeb
//                           "provider_id": int.parse(providerId),
//                           //  "service_price": servicePrice,
//                           "quantity": qty,
//                           "level": level,
//                           "date": date
//                           // ,
//                           // "attachment_ids":["dd","fff"]
//                         }
//                       }
//                     }
//                   : {
//                       "params": {
//                         "data": {
//                           "client_id": int.parse(userId),
//                           "category_id": int.parse(categoryId), //sebaka
//                           "service_id": int.parse(serviceId), // tarkeb
//                           "provider_id": int.parse(providerId),
//                           "service_price": servicePrice,
//                           "quantity": qty,
//                           "level": level,
//                           "date": date
//                           // ,
//                           // "attachment_ids":["dd","fff"]
//                         }
//                       }
//                     })
//           .onError((error, stackTrace) {
//         print(error.toString());
//       });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//   Future<Either<Failure, GetUserDataModel>> getUserData() async {
//     try {
//       String userId = await Preferences.instance.getUserId() ?? "1";
//       print("lllllllllll${userId}");
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getUserData + '&filter=[["id", "=","${userId}"]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetUserDataModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetAboutModel>> getAboutApp() async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.geAbout,
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetAboutModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetPrivacyPolicyModel>> getPrivacyPolicy() async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getPolicy,
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetPrivacyPolicyModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetPhoneModel>> getPhoneNumber() async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getPhone,
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetPhoneModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, DefaultModel>> addMessage({
//     required String name,
//     required String phone,
//     required String subject,
//     required String message,
//     required String messageMlassification,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();

//     try {
//       final response = await dio.post(EndPoints.complain,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "data": {
//                 "name": name,
//                 "phone": phone,
//                 "subject": subject,
//                 "message": message,
//                 "message_classification": messageMlassification
//               }
//             }
//           }).onError((error, stackTrace) {
//         print(error.toString());
//       });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, DefaultModel>> addProject({
//     required String name,
//     required String description,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     String userId = await Preferences.instance.getUserId() ?? "1";
//     try {
//       final response = await dio.post(EndPoints.project,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "data": {
//                 "name": name,
//                 "client_id": int.parse(userId),
//                 "desc": description
//               }
//             }
//           }).onError((error, stackTrace) {
//         print(error.toString());
//       });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
// // Future<Either<Failure, GetCompanyDataModel>> getCompanyData() async {
// //     AuthModel authModel = await Preferences.instance.getUser();
// //     try {
// //       String? sessionId = await Preferences.instance.getSessionId();
// //       final response = await dio.get(
// //         EndPoints.companyData +
// //             'query={id, name,street,currency_id,country_code,account_sale_tax_id,vat,company_registry,logo}&filter=[["id","=","${authModel.result!.userCompanies!.currentCompany!}"]]',
// //         options: Options(
// //           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
// //         ),
// //       );

// //       return Right(GetCompanyDataModel.fromJson(response));
// //     } on ServerException {
// //       return Left(ServerFailure());
// //     }
// //   }

//   Future<Either<Failure, GetOrdersDetailsModel>> getOrderDetails(
//       {required int orderId}) async {
//     try {
//       String userId = await Preferences.instance.getUserId() ?? "1";
//       print("lllllllllll${userId}");

//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.order +
//             '$orderId?query={id, name,date,total_price,state,preview_price,level,provider_id,service_id,category_id,quantity}',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetOrdersDetailsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, DefaultModel>> updateOrder({
//     required int orderId,
//     required String date,
//     required int qty,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.put(EndPoints.order,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: qty == 0
//               ? {
//                   "params": {
//                     "filter": [
//                       ["id", "=", orderId]
//                     ],
//                     "data": {"date": date}
//                   }
//                 }
//               : {
//                   "params": {
//                     "filter": [
//                       ["id", "=", orderId]
//                     ],
//                     "data": {"quantity": qty, "date": date}
//                   }
//                 });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, DefaultModel>> cancelOrder(
//       {required int orderId}) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.put(EndPoints.order,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "filter": [
//                 ["id", "=", orderId]
//               ],
//               "data": {"state": "cancel"}
//             }
//           });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//   Future<Either<Failure, DefaultModel>> addOrRemoveFavourite(
//       {required List<int> newFavouriteList}) async {
//      String sessionId = await getSessionId(phone: "admin", password: "admin");
//      String userId = await Preferences.instance.getUserId() ?? "1";
//     try {
//       final response = await dio.put(EndPoints.userUrl,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "filter": [
//                 ["id", "=", int.parse(userId)]
//               ],
//               "data": {
//             "favorite_user_ids": newFavouriteList
//         }
//             }
//           });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetProjectsModel>> getProjects(
//       // {required String filter}
//       ) async {
//     try {
//       String userId = await Preferences.instance.getUserId() ?? "1";
//       print("lllllllllll${userId}");

//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         // filter == "new"
//         //     ? EndPoints.project +
//         //         '?query={id,name,desc,date,state}&filter=[["client_id","=",$userId],["state", "=", "new"]]'
//         //     : filter == "complete"
//         //         ? EndPoints.project +
//         //             '?query={id,name,desc,date,state}&filter=[["client_id","=",$userId],["state", "=", "complete"]]'
//         //         : EndPoints.project +
//         //             '?query={id,name,desc,date,state}&filter=[["client_id","=",$userId],["state", "=", "in_progress"]]',

//         EndPoints.project +
//             '?query={id,name,desc,date,state}&filter=[["client_id","=",$userId]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetProjectsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetNameModel>> getCategoryName(
//       {required int categoryId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.categoryUrl +
//             '$categoryId?query={name}&filter=[["is_available","=","true"]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetNameModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetNameModel>> getServiceName(
//       {required int serviceId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.allProducts +
//             '$serviceId?query={ name}&filter=[["is_service_app","=","true"]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetNameModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetServiceDetails>> getServiceDetails(
//       {required int serviceId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.allProducts +
//             '$serviceId?query={ name,categ_id,list_price}&filter=[["is_service_app","=","true"]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetServiceDetails.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
}
