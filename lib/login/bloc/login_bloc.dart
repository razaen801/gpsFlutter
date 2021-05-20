import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:my_gps_app/login/model/email.dart';
import 'package:my_gps_app/login/model/password.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
   LoginBloc() : super(LoginState());

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    // TODO: implement onTransition
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is EmailChanged){
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email.valid ?email :Email.pure(event.email),
        status: Formz.validate([email,state.password]),
      );
    }
    else if(event is PasswordChanged){
      final password = Password.dirty(event.password);
      yield state.copyWith(password: password.valid?password:Password.pure(event.password),
          status: Formz.validate([state.email,password]));
    }
    else if (event is EmailUnfocused){
      final email = Email.dirty(state.email.value);
      yield state.copyWith(email: email,
      status: Formz.validate([email,state.password]));
    }

    else if(event is PasswordUnfocused){
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,status: Formz.validate([state.email,password])
      );
    }

    else if (event is FormSubmitted){
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
      yield state.copyWith(email: email,password: password, status: Formz.validate([email,password]),);
      if(state.status.isValidated){
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await Future<void>.delayed(const Duration(seconds: 2));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }

    }
  }
}
