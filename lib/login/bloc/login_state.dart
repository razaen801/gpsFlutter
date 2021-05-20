part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;

  LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
