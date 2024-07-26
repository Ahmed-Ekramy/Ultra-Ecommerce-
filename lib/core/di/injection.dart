import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
  getIt.registerFactory<ProductDetailsCubit>(
      () => ProductDetailsCubit(getIt()));
  getIt.registerFactory<ProductDetailRepoImp>(
      () => ProductDetailRepoImp(getIt()));
  getIt.registerFactory<LoginCubit>( ( ) => LoginCubit(getIt()));
  getIt.registerFactory<LoginRepo>( ( ) => LoginRepo(getIt()));
getIt.registerFactory<SignUpCubit>( ( ) => SignUpCubit(getIt()));
  getIt.registerFactory<SignUpRepo>( ( ) => SignUpRepo(getIt()));
  getIt.registerFactory<ApiService>(() => ApiService(Dio()));
}
