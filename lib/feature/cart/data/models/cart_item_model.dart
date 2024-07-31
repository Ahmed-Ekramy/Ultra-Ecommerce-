// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'cart_item_model.g.dart';

CartItemModel cartItemModelFromJson(String str) => CartItemModel.fromJson(json.decode(str));

String cartItemModelToJson(CartItemModel data) => json.encode(data.toJson());

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: "productid")
  final int productid;
  @JsonKey(name: "quantity")
  final int quantity;
  @JsonKey(name: "price")
  final int price;

  CartItemModel({
    required this.productid,
    required this.quantity,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
