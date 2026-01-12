import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_with_firebase/app/app.dart';
import 'package:flutter_chat_app_with_firebase/app/app_bloc_observer.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
