// ignore_for_file: use_build_context_synchronously

import 'package:delifast/core/models/login_model.dart';
import 'package:delifast/core/preferences/preferences.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:delifast/core/utils/appwidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_export.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.api) : super(LoginInitialState());
  ServiceApi api;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  bool isHidden = true;
  bool isHiddenNewPass = true;
  bool isHiddenConfirm = true;
  void togglePasswordVisibility() {
    isHidden = !isHidden;
    emit(changePasswordState()); // Trigger a rebuild by emitting a new state
  }

  void togglePasswordVisibility2() {
    isHiddenNewPass = !isHiddenNewPass;
    emit(changePasswordState()); // Trigger a rebuild by emitting a new state
  }

  void togglePasswordVisibility3() {
    isHiddenConfirm = !isHiddenConfirm;
    emit(changePasswordState()); // Trigger a rebuild by emitting a new state
  }

  AuthModel? authModel;

  Future<String> setSessionId(
      ) async {
    String mySessionId =
        await api.getSessionId(phone: "admin", password: "admin");
print ("llll : $mySessionId");
    return mySessionId;
  }

  login(BuildContext context,
      {required String phoneOrMail, required String password}) async {   
    emit(LoadingLoginState());


    AppWidget.createProgressDialog(context, 'انتظر');
    final response = await api.login(phoneOrMail, password);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(l.message ?? '');
      emit(FailureLoginState());
    }, (r) async {
      if (r.result != null) {
        authModel = r;
       // String sessionId =
       //     await api.getSessionId(phone: "admin", password: "admin");
        emit(SuccessLoginState());
      //  await Preferences.instance.setSessionId("07ae3f8fc94837d3915c99466591fc60664baf6e");        
           await Preferences.instance.setUserName(phoneOrMail);
          await Preferences.instance.setUserPass(password);
          await Preferences.instance.getUserPass();
          print(password);
        Navigator.pop(context);
        passwordController.clear();
        EmailController.clear();
        await Preferences.instance.setUserPass(password);
        await Preferences.instance.getUserPass();
        Preferences.instance.setUserId(r.result!.userContext!.uid.toString());
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.mainRoute, (route) => false);
      } else {
        errorGetBar("حدث خطأ ما");
        Navigator.pop(context);
      }
    });
  }

  void closeControllers() {
    EmailController.dispose();
    passwordController.dispose();
  }

  void signupValidate(BuildContext context) {
    if (formKey.currentState!.validate()) {
        login(context,phoneOrMail: EmailController.text,password: passwordController.text);
    
    }
  }

  void clearControllers() {
    EmailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    closeControllers();
    return super.close();
  }
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
