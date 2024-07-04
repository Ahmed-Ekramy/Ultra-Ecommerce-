

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_routes.dart';
class Ultra extends StatelessWidget {
  const Ultra({super.key});
  @override
  Widget build(BuildContext context) {
 return   ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: AppRoutes().generateRoute,
        );
      },

    );

  }
}