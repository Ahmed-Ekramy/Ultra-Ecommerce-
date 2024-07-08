import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/home/presentation/pages/tabs/notifaction_tab.dart';
import 'package:ultra/feature/home/presentation/pages/tabs/profile_tab.dart';

import '../pages/tabs/home_tabs.dart';
import '../pages/tabs/search_tab.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int selectedIndex = 0;
  int selectedIndexBrandShoes = 0;
  int selectedIndexBrandMakeUp = 0;
  int selectedIndexTypeOfClothes = 0;
  int searchIndexByName = 0;

  void changeNav(value) {
    currentIndex = value;
    emit(ChangeNavState());
  }

  void changeSelectedBrand(int index) {
    selectedIndexBrandShoes = index;
    emit(ChangeSelectedIndexBrandState());
  }
  void changeSelectedBrandMakeUp(int index) {
    selectedIndexBrandMakeUp = index;
    emit(ChangeSelectedIndexBrandMakeUpState());
  }
  void changeTypeOfClothes(int index) {
    selectedIndexTypeOfClothes = index;
    emit(ChangeSelectedIndexTypeOfClothesState());
  }
  void searchByName(int index) {
    searchIndexByName = index;
    emit(SearchIndexByNameState());
  }

  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const NotificationTab(),
    const ProfileTab()
  ];
}
