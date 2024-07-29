import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/product_details/presentation/manager/product_details_state.dart';
import '../../data/models/product_details_model.dart';
import '../../data/repositories/product_detail_repo_imp.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productDetailRepoImp)
      : super(ProductDetailsLoadingState());
  ProductDetailRepoImp productDetailRepoImp;

  ProductDetailModel? productDetailModel;

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  void getProductDetails(int id) async {
    var data = await productDetailRepoImp.getProductDetails(id);
    log("${data}xnxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    data.fold((l) => emit(ProductDetailsFailureState(l.message)), (r) {
      productDetailModel = r;
      emit(ProductDetailsSuccessState());
    });
  }
}
