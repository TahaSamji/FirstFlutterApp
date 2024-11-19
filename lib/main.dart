import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page.dart';
import 'package:flutter_application_1/auth/loginpage.dart';
import 'package:flutter_application_1/auth/signupPage.dart';
import 'package:flutter_application_1/bloc/bloc_dummy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignUpScreen());
    // home: BlocProvider(
    //   create: (context) => ProductBloc()..add(FetchProducts()),
    //   child: const MyProducts(),
    // ));
  }
}

class AuthService {
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return "Password weak";
      } else if (e.code == "email-already-in-use") {
        return "Acount Already exist";
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "User does not exist";
      } else if (e.code == "wrong-password") {
        return "wrong password";
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
