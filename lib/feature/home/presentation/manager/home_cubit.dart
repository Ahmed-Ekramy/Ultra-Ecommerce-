import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/home/data/repositories/home%20repo_imp.dart';
import 'package:ultra/feature/home/presentation/manager/home_state.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../data/models/catogries_model.dart';
import '../../data/models/product_model.dart';

class HomeCubit extends Cubit<ResultState<dynamic>> {
  HomeCubit(this.homeRepoImp) : super(const Loading());
  HomeRepoImp homeRepoImp;
  static HomeCubit get(context) => BlocProvider.of(context);
  int selectedIndexBrandShoes = 0;
  int selectedIndexBrandMakeUp = 0;
  int selectedIndexTypeOfClothes = 0;

  void changeSelectedBrand(int index) {
    selectedIndexBrandShoes = index;
    emit(ChangeSelectedIndexBrandState(index));
  }

  void changeSelectedBrandMakeUp(int index) {
    selectedIndexBrandMakeUp = index;
    emit(ChangeSelectedIndexBrandMakeUpState(index));
  }

  void changeTypeOfClothes(int index) {
    selectedIndexTypeOfClothes = index;
    emit(ChangeSelectedIndexTypeOfClothesState(index));
  }

  void getProducts() async {
    var data = await homeRepoImp.getProducts( );
    data.when(
        success: (List<ProductModel> productModel) {
          emit(ResultState.success(productModel));
        },
        failure: (NetworkExceptions networkExceptions) {
          log(networkExceptions.toString());
          emit(ResultState.error(networkExceptions));
        });
  }
  void getCategories() async {
    var data = await homeRepoImp.getCategories();
    data.when(success: (CategoryModel categoryModel) {
      log(categoryModel.categories[0].parant.name.toString());
      emit(ResultState.categoriesSuccess(categoryModel));
    },
        failure: (NetworkExceptions networkExceptions) {
          log(networkExceptions.toString());
          emit(ResultState.categoryError(networkExceptions));
        });
  }
}