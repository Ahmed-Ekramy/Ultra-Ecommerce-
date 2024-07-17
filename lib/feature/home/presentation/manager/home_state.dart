import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/network/network_exceptions.dart';

part 'home_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idle() = Idle<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.success(T data) = Success<T>;

  const factory ResultState.error(NetworkExceptions networkExceptions) =
      Error<T>;

  const factory ResultState.changeGridViewListViewState() =
      ChangeGridViewListViewState;

  const factory ResultState.changeNavState() = ChangeNavState;

  const factory ResultState.changeSelectedIndexBrandState() =
      ChangeSelectedIndexBrandState;

  const factory ResultState.changeSelectedIndexBrandMakeUpState ()=
      ChangeSelectedIndexBrandMakeUpState;

  const factory ResultState.changeSelectedIndexTypeOfClothesState() =
      ChangeSelectedIndexTypeOfClothesState;

  const factory ResultState.searchIndexByNameState() = SearchIndexByNameState;
}
// part of 'home_cubit.dart';
//
// @immutable
// sealed class HomeState {}
//
// final class HomeInitial extends HomeState {}
// final class ChangeGridViewListViewState extends HomeState {}
// final class ChangeNavState extends HomeState {}
// final class ChangeSelectedIndexBrandState extends HomeState {}
// final class ChangeSelectedIndexBrandMakeUpState extends HomeState {}
// final class ChangeSelectedIndexTypeOfClothesState extends HomeState {}
// final class SearchIndexByNameState extends HomeState {}
// final class GetProductsLoadingState extends HomeState {}
// final class GetProductsSuccessState extends HomeState {
//   final List<ProductModel> productModel;
//   GetProductsSuccessState(this.productModel);
// }
// final class GetProductsErrorState extends HomeState {
//   final String errorMessage;
//   GetProductsErrorState(this.errorMessage);
// }
