import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra/feature/home_layout/presentation/manager/layout_cubit.dart';
import 'package:ultra/feature/home_layout/presentation/manager/layout_state.dart';

import '../../../../core/network/api_service.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState<dynamic>>(
        buildWhen: (previous, current) =>
            current is Initial || current is ChangeNavState,
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: LayoutCubit.get(context)
                  .tabs[LayoutCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) {
                    LayoutCubit.get(context).changeNav(value);
                  },
                  currentIndex: LayoutCubit.get(context).currentIndex,
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
      ),
    );
  }
}
