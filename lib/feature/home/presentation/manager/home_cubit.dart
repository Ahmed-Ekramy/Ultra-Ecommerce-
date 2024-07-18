import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/home/data/repositories/home%20repo_imp.dart';
import 'package:ultra/feature/home/presentation/manager/home_state.dart';
import 'package:ultra/feature/home/presentation/pages/tabs/notifaction_tab.dart';
import 'package:ultra/feature/home/presentation/pages/tabs/profile_tab.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../data/models/product_model.dart';
import '../pages/tabs/home_tabs.dart';
import '../pages/tabs/search_tab.dart';

class HomeCubit extends Cubit<ResultState<List<ProductModel>>> {
  HomeCubit(this.homeRepoImp) : super(const Loading());
  HomeRepoImp homeRepoImp;
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int selectedIndex = 0;
  int selectedIndexBrandShoes = 0;
  int selectedIndexBrandMakeUp = 0;
  int selectedIndexTypeOfClothes = 0;
  int searchIndexByName = 0;
  bool isGridView = true;
  // List<ProductModel>? products;

  void changeGridViewListView() {
    isGridView = !isGridView;
    emit(ChangeGridViewListViewState());
  }

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
    emit(const SearchIndexByNameState());
  }

  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const NotificationTab(),
    const ProfileTab()
  ];

  void getProducts() async {
    var data = await homeRepoImp.getProducts();
    data.when(
 success: (List<ProductModel> productModel) {
   emit(ResultState.success(productModel));
 },
    failure: (NetworkExceptions networkExceptions) {
   log(networkExceptions.toString());
      emit(ResultState.error(networkExceptions));

    });
  }
}
