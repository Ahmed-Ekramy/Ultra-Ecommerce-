import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra/core/di/injection.dart';
import 'package:ultra/feature/home/presentation/manager/home_cubit.dart';
import '../../../../core/network/api_service.dart';
import '../manager/home_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: HomeCubit.get(context)
                .tabs[HomeCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  HomeCubit.get(context).changeNav(value);
                },
                currentIndex: HomeCubit.get(context).currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.homeAlt), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.search), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.bell), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.user), label: ''),
                ]),
          ),
        );
      },
    );
  }
}
