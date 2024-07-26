import 'package:ultra/core/network/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_details_state.freezed.dart';
@freezed
 class ProductDetailsState<T> with _$ProductDetailsState<T> {
  const factory ProductDetailsState.loading() = Loading<T>;
  const factory ProductDetailsState.success(T data) = Success<T>;
  const factory ProductDetailsState.error({required String error}) =
      Error<T>;
}
