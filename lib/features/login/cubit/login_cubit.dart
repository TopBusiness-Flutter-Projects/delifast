// ignore_for_file: use_build_context_synchronously

import 'package:delifast/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.api) : super(LoginInitialState());
  ServiceApi api;

  // addMember({
  //   required BuildContext context,
  //   String? position,
  //   String? name,
  //   String? nationalId,
  //   String? cardDate,
  //   String? address,
  //   String? phone,
  //   String? qualification,
  //   String? job,
  //   String? workPlace,
  //   String? partisan,
  //   String? placeAbroad,
  //   String? passport,
  // }) async {

  //   AppWidget.createProgressDialog(context, "جاري التحميل");
  //   emit(LoadingAddMemberState());
  //   final response = await api.addMember(
  //     type: genderRadioSelected == 1 ? "male" : "female",
  //     position: insideRadioSelected == 1 ? "in" : "out",
  //     imageFront: frontIDFile!.path,
  //     imageBack: backIDFile!.path,
  //     image: profileFile!.path,
  //     // ignore: prefer_null_aware_operators
  //     cv: cvFille != null ? cvFille!.path : null,
  //     name: name,
  //     nationalId: nationalId,
  //     cardDate: cardDate,
  //     governorateId: checkGovernmintId,
  //     address: address,
  //     phone: phone,
  //     qualification: qualification,
  //     job: job,
  //     workPlace: workPlace,
  //     partisan: partisan,
  //     countryId: insideRadioSelected == 1 ? null : checkCoutryId,
  //     placeAbroad: insideRadioSelected == 1 ? null : placeAbroad,
  //     passport: insideRadioSelected == 1 ? null : passport,
  //   );
  //   response.fold((l) {
  //     Navigator.pop(context);
  //     errorGetBar("حدث خطأ");
  //     emit(FailureAddMemberState());
  //   }, (r) {
  //     Navigator.pop(context);
  //     if (r.status == 1) {
  //       successGetBar(r.msg);
  //       Navigator.pushReplacementNamed(context, Routes.homeRoute);
  //     } else {
  //       errorGetBar(r.msg!);
  //     }

  //     emit(SuccessAddMemberState());
  //   });
  // }
}
