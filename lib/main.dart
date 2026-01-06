import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_with_firebase/app/app.dart';
import 'package:flutter_chat_app_with_firebase/app/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
