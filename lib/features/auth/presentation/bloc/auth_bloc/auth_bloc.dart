import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cravely/features/auth/domain/entities/user_entity.dart';
import 'package:cravely/features/auth/domain/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  late final StreamSubscription<UserEntity?> _userSubscription;

  AuthBloc(this.authRepo) : super(AuthState.initial()) {

      // send an event whenever the user data changes
    _userSubscription = authRepo.currentUser.listen((user) {
      add(AuthUserChanged(user));
    });

    on<LogInRequested>((event, emit) async {
      emit(AuthState.loading());

      try {
        await authRepo.signIn(event.email, event.password);

      } catch (e) {
        emit(AuthState.error(errorMessage: e.toString()));
      }
    });

    on<LogOutRequested>((event, emit) async {
      emit(AuthState.loading());

      try {
        await authRepo.logOut();
        
        emit(AuthState.unauthenticated());
      } catch (e) {
        emit(AuthState.error(errorMessage: e.toString()));
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthState.loading());
      try {
        await authRepo.signUp(event.user, event.password);
      } catch (e) {
        emit(AuthState.error(errorMessage: e.toString()));
      }
    });
  
    on<ResetPassRequested>((event, emit) async {
      try {
        await authRepo.resetPassword(event.email);

        emit(AuthState.resetPasswordSent());
      } catch (e) {
        emit(AuthState.error(errorMessage: e.toString()));
      }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(AuthState.loading());

      try {
        await authRepo.signInWithGoogle();
      } catch (e) {
        emit(AuthState.error(errorMessage: e.toString()));
      }
    });

    on<AuthUserChanged>((event, emit) {
      if (event.user != null && event.user != UserEntity.empty) {
        emit(AuthState.authenticated(user: event.user!));
      } else {
        emit(AuthState.unauthenticated());
      }
    });

  }

  // avoid memory leaks by cancelling the subscription when the bloc is closed
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

}