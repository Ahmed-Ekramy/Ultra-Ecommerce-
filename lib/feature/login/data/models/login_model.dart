import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';
@JsonSerializable()
class LoginModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "useEmail")
  final String useEmail;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "fullName")
  final String fullName;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @JsonKey(name: "expires_at")
  final int expiresAt;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "access_token")
  final String accessToken;

  LoginModel({
    required this.id,
    required this.useEmail,
    required this.avatar,
    required this.fullName,
    required this.phone,
    required this.expiresIn,
    required this.expiresAt,
    required this.refreshToken,
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
