import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/core/di/injection.dart';
import 'package:ultra/ultra_app.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/observer.dart';
import 'core/routes/routing.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  String route;
  var userId = CacheHelper.getData("UserId");
  print(userId);
  var user = CacheHelper.getData("User");

  if (user == null) {
    route = Routes.login;
  } else {
    route = Routes.home;
  }
  Bloc.observer = MyBlocObserver();
  runApp(Ultra(route));
}
