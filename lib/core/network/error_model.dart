import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  int code;
  String message;

  ErrorModel({required this.code, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}