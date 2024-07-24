// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: (json['productid'] as num).toInt(),
      name: json['name'] as String,
      discount: (json['discount'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      productImage: (json['product_image'] as List<dynamic>)
          .map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productid': instance.productId,
      'name': instance.name,
      'discount': instance.discount,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'product_image': instance.productImage,
    };

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
      imageurl: json['imageurl'] as String,
    );

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'imageurl': instance.imageurl,
    };
