import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/di/injection.dart';
import 'package:ultra/feature/home/presentation/manager/home_cubit.dart';
import 'core/network/api_service.dart';
import 'core/routes/app_routes.dart';

class Ultra extends StatelessWidget {
  final String route;
  const Ultra(this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  selectedIconTheme: IconThemeData(size: 30.sp),
                  unselectedIconTheme: IconThemeData(size: 25.sp))),
          debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings)=> AppRoutes.onGenrateRoute(settings),
            initialRoute: route,
        );
      },
    );
  }
}
