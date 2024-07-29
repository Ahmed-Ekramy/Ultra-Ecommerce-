import '../../data/models/product_details_model.dart';

abstract class ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}
class ProductDetailsSuccessState extends ProductDetailsState {
  ProductDetailsSuccessState();
}
class ProductDetailsFailureState extends ProductDetailsState {
  final String error;
  ProductDetailsFailureState(this.error);
}
