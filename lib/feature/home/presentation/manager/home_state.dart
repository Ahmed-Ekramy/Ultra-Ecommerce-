

import 'package:ultra/feature/home/data/models/catogries_model.dart';

import '../../data/models/product_model.dart';

sealed class HomeState{}

final class HomeInitial extends HomeState {}
final class ChangeGridViewListViewState extends HomeState {}
final class ChangeNavState extends HomeState {}
final class ChangeSelectedIndexBrandState extends HomeState {}
final class ChangeSelectedIndexBrandMakeUpState extends HomeState {}
final class ChangeSelectedIndexTypeOfClothesState extends HomeState {}
final class SearchIndexByNameState extends HomeState {}

final class GetProductsLoadingState extends HomeState {}
final class GetProductsSuccessState extends HomeState {
  final List<ProductModel> productModel;
  GetProductsSuccessState(this.productModel);
}
final class GetProductsErrorState extends HomeState {
  final String errorMessage;
  GetProductsErrorState(this.errorMessage);
}

final class GetCategoriesLoadingState extends HomeState {}
final class GetCategoriesSuccessState extends HomeState {
  final List<CategoryModel> categoryModel;
  GetCategoriesSuccessState(this.categoryModel);
}
final class GetCategoriesErrorState extends HomeState {
  final String errorMessage;
  GetCategoriesErrorState(this.errorMessage);
}

