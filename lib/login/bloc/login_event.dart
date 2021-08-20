part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {

  LoginEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];

}

class EmailChanged extends LoginEvent{
  final String email;
   EmailChanged({required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class EmailUnfocused extends LoginEvent{}

class PasswordChanged extends LoginEvent{
   PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends LoginEvent{}

class FormSubmitted extends LoginEvent{

  final String email;
  final String password;

  FormSubmitted({required this.password,required this.email});
}

class RegisterFormSubmitted extends LoginEvent{
  final String email;
  final String password;
  final String serial_number;
  final String ime_number;
  final String sim_number;
  final String device_model;

  RegisterFormSubmitted({required this.email, required this.password, required this.serial_number,
      required this.ime_number, required this.sim_number, required this.device_model});
}

