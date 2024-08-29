import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/get_about_model.dart';
import '../../../core/models/get_policy_model.dart';
import '../../../core/models/user_data_model.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/remote/service.dart';
import '../../../core/utils/app_export.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.api) : super(SettingInitial());
  ServiceApi api;
  //aboutapp
  GetAboutModel AboutModel = GetAboutModel();
  getAboutApp() async {
    emit(LoadingAbout());
    final response = await api.getAboutApp();
    response.fold((l) {
      emit(ErrorAbout());
    }, (r) {
      AboutModel = r;
      emit(LoadedAbout());
    });
  }
  //privacy
  GetPrivacyPolicyModel privacyModel = GetPrivacyPolicyModel();
  getPrivacy() async {
    emit(LoadingPrivacy());
    final response = await api.getPrivacyPolicy();
    response.fold((l) {
      emit(ErrorPrivacy());
    }, (r) {
      privacyModel = r;
      emit(LoadedPrivacy());
    });
  }
  //getuserData
  GetUserDataModel userDataModel = GetUserDataModel();
 Future getUserData() async {

   SharedPreferences preferences = await SharedPreferences.getInstance();
   String? userPass = preferences.getString('userPass');
    emit(LoadingUserData());
    print("loading");
    final response = await api.getUserData();
    print("loadingggggggggggg");

    response.fold((l) {
      print("fails");

      emit(ErrorUserDatay());
    }, (r) {
        userDataModel = r;
      print('dddddddddddd${r.result?.first.name??'ppppppp'}');
      nameControllser.text =  userDataModel.result?.first.name ?? "";
      emailController.text =  userDataModel.result?.first.email ?? "";
      addressController.text =  userDataModel.result?.first.street ?? "";
      mobileController.text =  userDataModel.result?.first.mobile ?? "";
    
      emit(LoadedUserData());
    });
  }
  //post data profile

  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController nameControllser = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
  //update profile
  updateProfile(BuildContext context) async {
    print("user profile");
 //   print(Preferences.instance.getUserPass()()??"");
    Preferences.instance.getUserPass();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userPass = preferences.getString('userPass');
    print(userPass);
    String theNewPassword =userPass!;

    if (passwordController.text.isNotEmpty){
      theNewPassword =passwordController.text;
      if(passwordController.text==userPass){
        print("pass=userpass");
        if(newPasswordController.text==ConfirmPasswordController.text){
          print("pass=confirm pass");
          emit(LoadingUpdateProfileState());
          final response = await api.updateProfile(
            mobile:mobileController.text ,
            name:nameControllser.text,
            street: addressController.text,
            newpass:theNewPassword, email: emailController.text,
          );
          response.fold((l) {
            errorGetBar("d");
            emit(FailureUpdateProfileState());
          }, (r) async {
            print(r.result);
            if (r.result != null) {
              // Navigator.pushNamedAndRemoveUntil(
              // context, Routes.mainRoute, (route) => false);
              successGetBar(r.result.toString());
              Preferences.instance.setUserPass(newPasswordController.text);
              print(newPasswordController.text);
              Navigator.pushReplacementNamed(context, Routes.mainRoute);
              newPasswordController.clear();
              ConfirmPasswordController.clear();
              passwordController.clear();
///
            } else {
              errorGetBar("حدث خطأ ما");
            }
          });
        }
        else{
          errorGetBar("passeError".tr());      }
      }
      else{
        errorGetBar("passwordNotSame".tr());
      }
} else{
      errorGetBar("passwordNotSame".tr());
    }
  }
}
