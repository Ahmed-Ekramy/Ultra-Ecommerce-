// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      id: json['id'] as String,
      useEmail: json['useEmail'] as String,
      avatar: json['avatar'] as String,
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      expiresAt: (json['expires_at'] as num).toInt(),
      refreshToken: json['refresh_token'] as String,
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'useEmail': instance.useEmail,
      'avatar': instance.avatar,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'expires_in': instance.expiresIn,
      'expires_at': instance.expiresAt,
      'refresh_token': instance.refreshToken,
      'access_token': instance.accessToken,
    };
