import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/cart/data/models/cart_model.dart';
import 'package:ultra/feature/cart/data/repositories/cart_repo.dart';

import '../../data/models/cart_item_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartRepo cartRepo;
  CartModel? cartList;
  void increment() {
    emit(CartIncrement());
  }
  void decrement() {
    emit(CartDecrement());
  }
  void reset() {
    emit(CartInitial());
  }
  void getCart()async {
    emit(CartLoading());
 var data =await cartRepo.getCart();
 log(data.toString());
    data.fold((l) {
      log(l.message.toString());
      emit(CartError(l.message));
    }, (r) {
      cartList=r;
      emit(CartSuccess());
    });
  }
}