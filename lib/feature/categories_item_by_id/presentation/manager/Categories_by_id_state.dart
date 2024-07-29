import 'package:ultra/feature/categories_item_by_id/data/models/product_by_category_model.dart';

import '../../data/models/banner_category_model.dart';
import '../../data/models/brand_category_model.dart';

abstract class CategoriesByIdState{}

class CategoriesByIdInitial extends CategoriesByIdState{}

class CategoriesByIdLoading extends CategoriesByIdState{}

class BrandCategoriesByIdSuccess extends CategoriesByIdState{

  BrandCategoriesByIdSuccess();
}

class BannerCategoriesByIdSuccess extends CategoriesByIdState{
  final List<BannerCategoryModel> bannerCategoryModel;
  BannerCategoriesByIdSuccess({required this.bannerCategoryModel});
}
class ProductCategoriesByIdSuccess extends CategoriesByIdState{
  // final List<ProductCategoryModel> productByCategoryModel;
  ProductCategoriesByIdSuccess();
}

class BannerCategoriesByIdError extends CategoriesByIdState{
  final String error;
  BannerCategoriesByIdError({required this.error});
}

class BrandCategoriesByIdError extends CategoriesByIdState{
  final String error;
  BrandCategoriesByIdError({required this.error});
}
class ProductCategoriesByIdError extends CategoriesByIdState{
  final String error;
  ProductCategoriesByIdError({required this.error});
}