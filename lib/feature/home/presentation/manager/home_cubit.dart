import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/home/data/repositories/home%20repo_imp.dart';
import 'package:ultra/feature/home/presentation/manager/home_state.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../search/presentation/pages/search_tab.dart';
import '../../data/models/catogries_model.dart';
import '../../data/models/product_model.dart';
import '../pages/tabs/home_tabs.dart';
import '../pages/tabs/notifaction_tab.dart';
import '../pages/tabs/profile_tab.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImp) : super(HomeInitial());
  HomeRepoImp homeRepoImp;

  static HomeCubit get(context) => BlocProvider.of(context);
  int selectedIndexBrandShoes = 0;
  int selectedIndexBrandMakeUp = 0;
  int selectedIndexTypeOfClothes = 0;
  int currentIndex = 0;
  int selectedIndex = 0;
  bool isGridView = true;
  int searchIndexByName = 0;
   List<ProductModel> productModel=[];
   List<CategoryModel> categoryModel=[];

  void changeNav(value) {
    currentIndex = value;
    emit(ChangeNavState());
  }

  List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    NotificationTab(),
    ProfileTab()
  ];

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

  void getProducts() async {
    var data = await homeRepoImp.getProducts();
    data.fold((l) {
      return emit(GetProductsErrorState(l.message));
    }, (r) {
      productModel =r;
      emit(GetProductsSuccessState());
    });
  }

  void getCategories() async {
    var data = await homeRepoImp.getCategories();
    data.fold((l) {
      return emit(GetCategoriesErrorState(l.message));
    }, (r) {
      categoryModel=r;
      emit(GetCategoriesSuccessState());
    });
  }

  void searchByName(int index) {
    searchIndexByName = index;
    emit(SearchIndexByNameState());
  }

  void changeGridViewListView() {
    isGridView = !isGridView;
    emit(ChangeGridViewListViewState());
  }
}
