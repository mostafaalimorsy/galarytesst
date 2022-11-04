
import 'package:galarytesst/model/login.dart';

abstract class LoginStates {}



class IntialLoginStates extends LoginStates {}
class LoadingStates extends LoginStates {}
class ScuccessStates extends LoginStates {
  final LoginModel PostLogin;


  ScuccessStates(this.PostLogin);





}
class ErrorStates extends LoginStates {
  final String error ;
  ErrorStates(this.error);


}

class ChangPasswordVisabilityStates extends LoginStates {}





