import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ultra/feature/home/presentation/manager/home_cubit.dart';
import '../../feature/home/data/repositories/home repo_imp.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<HomeRepoImp>(() => HomeRepoImp(getIt()));
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}