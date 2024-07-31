// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      productid: (json['productid'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'productid': instance.productid,
      'quantity': instance.quantity,
      'price': instance.price,
    };
