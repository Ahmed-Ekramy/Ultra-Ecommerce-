// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerCategoryModel _$BannerCategoryModelFromJson(Map<String, dynamic> json) =>
    BannerCategoryModel(
      id: (json['id'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$BannerCategoryModelToJson(
        BannerCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'imageUrl': instance.imageUrl,
    };
