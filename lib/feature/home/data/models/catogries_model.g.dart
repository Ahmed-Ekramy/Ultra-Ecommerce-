// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catogries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      parant: Parant.fromJson(json['parant'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>)
          .map((e) => Child.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'parant': instance.parant,
      'children': instance.children,
      'products': instance.products,
    };

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      categoryid: (json['categoryid'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'],
      bannerimageurl: json['bannerimageurl'],
      parentcategoryid: (json['parentcategoryid'] as num).toInt(),
      createdat: DateTime.parse(json['createdat'] as String),
      imageurl: json['imageurl'] as String,
    );

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'categoryid': instance.categoryid,
      'name': instance.name,
      'description': instance.description,
      'bannerimageurl': instance.bannerimageurl,
      'parentcategoryid': instance.parentcategoryid,
      'createdat': instance.createdat.toIso8601String(),
      'imageurl': instance.imageurl,
    };

Parant _$ParantFromJson(Map<String, dynamic> json) => Parant(
      name: json['name'] as String,
      bannerImage: json['banner_image'] as String,
    );

Map<String, dynamic> _$ParantToJson(Parant instance) => <String, dynamic>{
      'name': instance.name,
      'banner_image': instance.bannerImage,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productid: (json['productid'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productid': instance.productid,
      'name': instance.name,
      'price': instance.price,
      'discount': instance.discount,
      'discountedPrice': instance.discountedPrice,
      'imageUrl': instance.imageUrl,
    };
