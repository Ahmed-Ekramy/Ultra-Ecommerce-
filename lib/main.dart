import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/core/di/injection.dart';
import 'package:ultra/ultra_app.dart';
import 'core/helpers/observer.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(const Ultra());
}



