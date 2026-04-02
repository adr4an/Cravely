import 'package:cravely/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {

  UserModel({
    required super.userId,
    required super.email,
    required super.phoneNumber,
    required super.isNewUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as int,
      isNewUser: false,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      userId: entity.userId,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      isNewUser: entity.isNewUser,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
  
}