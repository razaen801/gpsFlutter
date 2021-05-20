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

class FormSubmitted extends LoginEvent{}

