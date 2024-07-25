abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class SuccessAddMemberState extends LoginStates {}

class FailureAddMemberState extends LoginStates {}

class LoadingAddMemberState extends LoginStates {}
