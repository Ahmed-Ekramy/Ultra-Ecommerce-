// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'session': instance.session,
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      expiresAt: (json['expires_at'] as num).toInt(),
      refreshToken: json['refresh_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'expires_at': instance.expiresAt,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      aud: json['aud'] as String,
      role: json['role'] as String,
      email: json['email'] as String,
      emailConfirmedAt: DateTime.parse(json['email_confirmed_at'] as String),
      phone: json['phone'] as String,
      lastSignInAt: DateTime.parse(json['last_sign_in_at'] as String),
      appMetadata:
          AppMetadata.fromJson(json['app_metadata'] as Map<String, dynamic>),
      userMetadata:
          Data.fromJson(json['user_metadata'] as Map<String, dynamic>),
      identities: (json['identities'] as List<dynamic>)
          .map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isAnonymous: json['is_anonymous'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'aud': instance.aud,
      'role': instance.role,
      'email': instance.email,
      'email_confirmed_at': instance.emailConfirmedAt.toIso8601String(),
      'phone': instance.phone,
      'last_sign_in_at': instance.lastSignInAt.toIso8601String(),
      'app_metadata': instance.appMetadata,
      'user_metadata': instance.userMetadata,
      'identities': instance.identities,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_anonymous': instance.isAnonymous,
    };

AppMetadata _$AppMetadataFromJson(Map<String, dynamic> json) => AppMetadata(
      provider: json['provider'] as String,
      providers:
          (json['providers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AppMetadataToJson(AppMetadata instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'providers': instance.providers,
    };

Identity _$IdentityFromJson(Map<String, dynamic> json) => Identity(
      identityId: json['identity_id'] as String,
      id: json['id'] as String,
      userId: json['user_id'] as String,
      identityData:
          Data.fromJson(json['identity_data'] as Map<String, dynamic>),
      provider: json['provider'] as String,
      lastSignInAt: DateTime.parse(json['last_sign_in_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      email: json['email'] as String,
    );

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'identity_id': instance.identityId,
      'id': instance.id,
      'user_id': instance.userId,
      'identity_data': instance.identityData,
      'provider': instance.provider,
      'last_sign_in_at': instance.lastSignInAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'email': instance.email,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      avatar: json['avatar'] as String,
      email: json['email'] as String,
      emailVerified: json['email_verified'] as bool,
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      phoneVerified: json['phone_verified'] as bool,
      sub: json['sub'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'phone_verified': instance.phoneVerified,
      'sub': instance.sub,
    };
