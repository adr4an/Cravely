part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {

  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInRequested extends AuthEvent {
  final String email;
  final String password;
  
  const LogInRequested(this.email, this.password);
}

class LogOutRequested extends AuthEvent {}

class GoogleSignInRequested extends AuthEvent {}


class SignUpRequested extends AuthEvent {
  final UserEntity user;
  final String password;
  
  const SignUpRequested(this.user, this.password);
}

class ResetPassRequested extends AuthEvent {
  final String email;

  const ResetPassRequested(this.email);
}

class AuthUserChanged extends AuthEvent {
  final UserEntity? user;

  const AuthUserChanged(this.user);

  @override
  List<Object> get props => [user ?? ''];

}