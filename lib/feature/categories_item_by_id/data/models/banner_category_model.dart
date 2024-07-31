// To parse this JSON data, do
//
//     final bannerCategoryModel = bannerCategoryModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'banner_category_model.g.dart';

@JsonSerializable()
class BannerCategoryModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "productId")
  final int productId;
  @JsonKey(name: "imageUrl")
  final String imageUrl;

  BannerCategoryModel({
    required this.id,
    required this.productId,
    required this.imageUrl,
  });

  factory BannerCategoryModel.fromJson(Map<String, dynamic> json) => _$BannerCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerCategoryModelToJson(this);
}

