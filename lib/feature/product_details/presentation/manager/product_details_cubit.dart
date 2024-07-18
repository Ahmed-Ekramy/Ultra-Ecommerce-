
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/product_details/presentation/manager/product_details_state.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../data/models/product_details_model.dart';
import '../../data/repositories/product_detail_repo_imp.dart';
class ProductDetailsCubit extends Cubit< ProductDetailsState <ProductDetailModel>> {
  ProductDetailsCubit(this.productDetailRepoImp) : super(const Loading());
  ProductDetailRepoImp productDetailRepoImp ;
  void getProductDetails(num id) async {
    var data = await productDetailRepoImp.getProductDetails(id);
    log("${data}xnxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    data.when(
      success: (ProductDetailModel productDetailsModel) {
        emit(ProductDetailsState.success(productDetailsModel));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ProductDetailsState.error(networkExceptions));
      },
    );
  }
}
