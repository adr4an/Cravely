class UserEntity {

  final String userId;
  final String email;
  final int phoneNumber;
  final bool isNewUser;

  UserEntity({
    required this.userId,
    required this.email,
    required this.phoneNumber,
    this.isNewUser = false,
  });

  // Empty user entity for cases where user data is not available
  static final UserEntity empty = UserEntity(
    userId: '',
    email: '',
    phoneNumber: 0,
    isNewUser: false,
    );

  UserEntity copyWith({
    String? userId,
    String? email,
    int? phoneNumber,
    bool? isNewUser,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isNewUser: isNewUser ?? this.isNewUser,
    );
  }

}
