import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:my_gps_app/login/model/email.dart';
import 'package:my_gps_app/login/model/password.dart';
import 'package:my_gps_app/server_handler/login/login_data_source.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginDataSource repository;
   LoginBloc({required this.repository}) : super(LoginState());

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
      yield LoginLoading();

      try {
        var login = await repository.loginUser(event.email, event.password);
        if(login?.token?.isEmpty ?? true){
                yield LoginError("Login Failed");
              }
              else{
                print(login.toString());
                await RaSharedPreferenceConfig.setToken(login.token);
                await RaSharedPreferenceConfig.setDeviceId(-1);
                await RaSharedPreferenceConfig.setDeviceName("No device ");
                yield LoginSuccess();
              }
      } on DioError catch(e){
        print(e);
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          yield LoginError("Connection Error");
        }
        else if (e.type == DioErrorType.other) {
          yield LoginError("Connection error");
        } else {
          yield LoginError("Username or Password doesn't match");
        }
      }
      // await Future<void>.delayed(const Duration(seconds: 3));
      //
      // if(event.email=="admin" && event.password=="12345"){
      //   yield LoginSuccess();
      // }
      // else{
      //   yield LoginError("Invalid Password or email");
      // }

      // final email = Email.dirty(state.email.value);
      // final password = Password.dirty(state.password.value);
      // yield state.copyWith(email: email,password: password, status: Formz.validate([email,password]),);
      // if(state.status.isValidated){
      //   yield state.copyWith(status: FormzStatus.submissionInProgress);
      //   await Future<void>.delayed(const Duration(seconds: 2));
      //   yield state.copyWith(status: FormzStatus.submissionSuccess);
      // }

    }

    else if(event is RegisterFormSubmitted){
      yield LoginLoading();

      await Future<void>.delayed(const Duration(seconds: 3));

      yield ApiCallSuccess();

    }
  }
}
