abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {}

class CartError extends CartState {

  final String error;
  CartError(this.error);
}
class CartIncrement extends CartState {}
class CartDecrement extends CartState {}