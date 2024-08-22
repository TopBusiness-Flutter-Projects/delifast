abstract class LoginStates {}

class LoginInitialState extends LoginStates {}
class changePasswordState extends LoginStates {}

class SuccessAddMemberState extends LoginStates {}

class FailureAddMemberState extends LoginStates {}

class LoadingAddMemberState extends LoginStates {}
class SuccessLoginState extends LoginStates {}
class FailureLoginState extends LoginStates {}
class LoadingLoginState extends LoginStates {}
