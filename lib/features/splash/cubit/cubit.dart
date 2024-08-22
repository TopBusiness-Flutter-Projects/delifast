import 'package:delifast/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.api) : super(SplashInitial()) {
    getSessionId();
  }

  ServiceApi api;

  Future getSessionId() async {
    emit(SplashLoading());

    final res = await api.getSessionId();
    print('res : $res');
    // if (res == 'error') {
    //   // Preferences.instance.setSessionId('');
    //   emit(SplashError());
    // } else {
    //   // Preferences.instance.setSessionId(res);
    //
    //   emit(SplashLoaded());
    // }
  }
}
