import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_validator/form_validator.dart';

import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInital());

  void userLogIn(String email, String password) async {
    final validateEmail =
        ValidationBuilder().email().maxLength(255).build().call(email);
    final validatePassword =
        ValidationBuilder().minLength(8).build().call(password);
    if (validateEmail != null || validatePassword != null) {
      emit(LoginValidationError(
        errorMessage: {
          'email': validateEmail,
          'password': validatePassword,
        },
      ));
    } else {
      try {
        emit(LoginChecking());
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: email,
              password: password,
            )
            .timeout(const Duration(seconds: 30));
        emit(LoginSuccessfully());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(LoginCredentialsError(errorMessage: 'User not found!'));
        } else if (e.code == 'wrong-password') {
          emit(LoginCredentialsError(errorMessage: 'Wrong password!'));
        }
      } on TimeoutException catch (e) {
        // pass timeout exception here
      }
    }
  }
}
