import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  @JsonKey(name: "user")
  final User user;
  @JsonKey(name: "session")
  final Session session;

  SignUpModel({
    required this.user,
    required this.session,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}

@JsonSerializable()
class Session {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "token_type")
  final String tokenType;
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @JsonKey(name: "expires_at")
  final int expiresAt;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "user")
  final User user;

  Session({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.expiresAt,
    required this.refreshToken,
    required this.user,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "aud")
  final String aud;
  @JsonKey(name: "role")
  final String role;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "email_confirmed_at")
  final DateTime emailConfirmedAt;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "last_sign_in_at")
  final DateTime lastSignInAt;
  @JsonKey(name: "app_metadata")
  final AppMetadata appMetadata;
  @JsonKey(name: "user_metadata")
  final Data userMetadata;
  @JsonKey(name: "identities")
  final List<Identity> identities;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "is_anonymous")
  final bool isAnonymous;

  User({
    required this.id,
    required this.aud,
    required this.role,
    required this.email,
    required this.emailConfirmedAt,
    required this.phone,
    required this.lastSignInAt,
    required this.appMetadata,
    required this.userMetadata,
    required this.identities,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnonymous,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class AppMetadata {
  @JsonKey(name: "provider")
  final String provider;
  @JsonKey(name: "providers")
  final List<String> providers;

  AppMetadata({
    required this.provider,
    required this.providers,
  });

  factory AppMetadata.fromJson(Map<String, dynamic> json) =>
      _$AppMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$AppMetadataToJson(this);
}

@JsonSerializable()
class Identity {
  @JsonKey(name: "identity_id")
  final String identityId;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "user_id")
  final String userId;
  @JsonKey(name: "identity_data")
  final Data identityData;
  @JsonKey(name: "provider")
  final String provider;
  @JsonKey(name: "last_sign_in_at")
  final DateTime lastSignInAt;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "email")
  final String email;

  Identity({
    required this.identityId,
    required this.id,
    required this.userId,
    required this.identityData,
    required this.provider,
    required this.lastSignInAt,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
  });

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "email_verified")
  final bool emailVerified;
  @JsonKey(name: "fullName")
  final String fullName;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "phone_verified")
  final bool phoneVerified;
  @JsonKey(name: "sub")
  final String sub;

  Data({
    required this.email,
    required this.emailVerified,
    required this.fullName,
    required this.phone,
    required this.phoneVerified,
    required this.sub,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
