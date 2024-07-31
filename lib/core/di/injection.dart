import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ultra/feature/cart/data/models/cart_model.dart';
import 'package:ultra/feature/cart/data/repositories/cart_repo.dart';
import 'package:ultra/feature/cart/presentation/manager/cart_cubit.dart';
import 'package:ultra/feature/categories_item_by_id/data/repositories/categories_item%20_by_id_repo.dart';
import 'package:ultra/feature/categories_item_by_id/presentation/manager/Categories_by_id_state.dart';
import 'package:ultra/feature/categories_item_by_id/presentation/manager/category_by_id_cubit.dart';
import 'package:ultra/feature/login/data/repositories/login_repo_imp.dart';
import 'package:ultra/feature/login/presentation/manager/login_cubit.dart';
import 'package:ultra/feature/sign_up/data/repositories/sign_up_repo.dart';
import 'package:ultra/feature/sign_up/presentation/manager/sign_up_cubit.dart';

import '../../feature/home/data/repositories/home repo_imp.dart';
import '../../feature/home/presentation/manager/home_cubit.dart';
import '../../feature/product_details/data/repositories/product_detail_repo_imp.dart';
import '../../feature/product_details/presentation/manager/product_details_cubit.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<HomeRepoImp>(() => HomeRepoImp(getIt()));

  getIt.registerFactory<CategoryByIdCubit>(() => CategoryByIdCubit(getIt()));
  getIt.registerFactory<CategoriesItemByIdRepo>(
      () => CategoriesItemByIdRepo(getIt()));

  getIt.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(getIt()));
  getIt.registerFactory<ProductDetailRepoImp>(
      () => ProductDetailRepoImp(getIt()));

  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
  getIt.registerFactory<CartRepo>(
      () => CartRepo(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerFactory<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<ApiService>(() => ApiService(Dio()));
}
