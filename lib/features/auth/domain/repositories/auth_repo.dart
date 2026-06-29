import 'package:cravely/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  
  // auth state stream - emits null when logged out
  Stream<UserEntity?> get currentUser;

  Future<void> signIn(String email, String password);

  Future<UserEntity> signUp(UserEntity user, String password);

  Future<void> setUserData(UserEntity user);

  Future<void> resetPassword(String email);

  Future<void> logOut();

  Future <void> signInWithGoogle();

  Future<void> signInWithApple();  
}