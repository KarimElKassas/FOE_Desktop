abstract class LoginStates {}

class LoginInitState extends LoginStates{}
class LoginLoadingState extends LoginStates{}

class LoginLoadingChatsState extends LoginStates{}
class LoginGetChatsSuccessState extends LoginStates{}
class LoginGetChatsErrorState extends LoginStates{
  final String error;

  LoginGetChatsErrorState(this.error);
}

class LoginSuccessState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String error;

  LoginErrorState(this.error);
}

