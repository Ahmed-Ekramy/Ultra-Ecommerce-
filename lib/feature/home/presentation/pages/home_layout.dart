import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra/feature/home/presentation/manager/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
          body: HomeCubit
              .get(context)
              .tabs[HomeCubit
              .get(context)
              .currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                HomeCubit.get(context).changeNav(value);
              },
              currentIndex: HomeCubit.get(context).currentIndex,
              items: const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.
          homeAlt), label: ''),
      BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search), label: ''),
      BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bell), label: ''),
      BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: ''),
      ]),
      ),
    );
  },
),
);
  }
}
