// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      cartid: (json['cartid'] as num).toInt(),
      totalamount: (json['totalamount'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      totalamountWithOutDiscount:
          (json['totalamountWithOutDiscount'] as num).toInt(),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'cartid': instance.cartid,
      'totalamount': instance.totalamount,
      'discount': instance.discount,
      'totalamountWithOutDiscount': instance.totalamountWithOutDiscount,
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      productid: (json['productid'] as num).toInt(),
      imageurl: json['imageurl'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'discount': instance.discount,
      'productid': instance.productid,
      'imageurl': instance.imageurl,
      'quantity': instance.quantity,
    };
