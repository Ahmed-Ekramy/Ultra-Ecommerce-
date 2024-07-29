

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'brand_category_model.g.dart';

List<List<BrandCategoryModel>> brandCategoryModelFromJson(String str) => List<List<BrandCategoryModel>>.from(json.decode(str).map((x) => List<BrandCategoryModel>.from(x.map((x) => BrandCategoryModel.fromJson(x)))));

String brandCategoryModelToJson(List<List<BrandCategoryModel>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

@JsonSerializable()
class BrandCategoryModel {
  @JsonKey(name: "Name")
  final String name;
  @JsonKey(name: "imageUrl")
  final String imageUrl;

  BrandCategoryModel({
    required this.name,
    required this.imageUrl,
  });

  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) => _$BrandCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandCategoryModelToJson(this);
}
