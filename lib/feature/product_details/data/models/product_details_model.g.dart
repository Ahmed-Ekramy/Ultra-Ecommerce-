// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      productid: (json['productid'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      sku: json['sku'] as String,
      createdat: DateTime.parse(json['createdat'] as String),
      updatedat: DateTime.parse(json['updatedat'] as String),
      discount: (json['discount'] as num).toInt(),
      brandId: (json['brandId'] as num).toInt(),
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      productImage: (json['product_image'] as List<dynamic>)
          .map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: (json['specifications'] as List<dynamic>)
          .map((e) => Specification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'productid': instance.productid,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'sku': instance.sku,
      'createdat': instance.createdat.toIso8601String(),
      'updatedat': instance.updatedat.toIso8601String(),
      'discount': instance.discount,
      'brandId': instance.brandId,
      'highlights': instance.highlights,
      'discountedPrice': instance.discountedPrice,
      'product_image': instance.productImage,
      'specifications': instance.specifications,
    };

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
      imageurl: json['imageurl'] as String,
    );

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'imageurl': instance.imageurl,
    };

Specification _$SpecificationFromJson(Map<String, dynamic> json) =>
    Specification(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$SpecificationToJson(Specification instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
