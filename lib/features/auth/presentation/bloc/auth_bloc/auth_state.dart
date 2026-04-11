part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
  requiresProfile,  // new Google user needs to complete profile
  loading,
  error,
  resetPasswordSent,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final UserEntity? user;
  final String? errorMessage;

  const AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });

  const AuthState.initial() : this(status: AuthStatus.initial);

  const AuthState.loading() : this(status: AuthStatus.loading);

  const AuthState.authenticated({required UserEntity user})
      : this(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated() 
    : this(status: AuthStatus.unauthenticated);

  const AuthState.requiresProfile({required UserEntity user})
      : this(status: AuthStatus.requiresProfile, user: user);

  const AuthState.error({required String errorMessage})
      : this(status: AuthStatus.error, errorMessage: errorMessage);

  const AuthState.resetPasswordSent() 
    : this(status: AuthStatus.resetPasswordSent);
  
  @override
  List<Object?> get props => [status, user, errorMessage]; 
  
}