part of 'setting_cubit.dart';

@immutable
sealed class SettingState {}

final class SettingInitial extends SettingState {}
//about
final class LoadingAbout extends SettingState {}
final class LoadedAbout extends SettingState {}
final class ErrorAbout extends SettingState {}
//privacy
final class LoadingPrivacy extends SettingState {}
final class LoadedPrivacy extends SettingState {}
final class ErrorPrivacy extends SettingState {}
//user data
final class LoadingUserData extends SettingState {}
final class LoadedUserData extends SettingState {}
final class ErrorUserDatay extends SettingState {}
//pass
final class changePasswordState extends SettingState {}

class SuccessAddMemberState extends SettingState {}

class FailureAddMemberState extends SettingState {}

class LoadingAddMemberState extends SettingState {}
// update profile
final class LoadingUpdateProfileState extends SettingState {}

class SuccessUpdateProfileState extends SettingState {}

class FailureUpdateProfileState extends SettingState {}

