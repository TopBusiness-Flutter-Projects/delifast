import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboard_states.dart';

class  OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit(Object object) : super( OnboardingInitialState());

  static  OnboardingCubit getObject(context) => BlocProvider.of(context);



}