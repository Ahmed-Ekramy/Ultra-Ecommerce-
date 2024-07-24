

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/pages/tabs/home_tabs.dart';
import '../../../home/presentation/pages/tabs/notifaction_tab.dart';
import '../../../home/presentation/pages/tabs/profile_tab.dart';
import '../../../search/presentation/pages/search_tab.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(const LayoutState.initial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int selectedIndex = 0;
  void changeNav(value) {
    currentIndex = value;
    emit(LayoutState.changeNavState(value));
  }
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const NotificationTab(),
    const ProfileTab()
  ];
}
