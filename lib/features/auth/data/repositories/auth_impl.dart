import 'package:cravely/core/utils/helpers/log_helper.dart';
import 'package:cravely/features/auth/data/models/user_model.dart';
import 'package:cravely/features/auth/domain/entities/user_entity.dart';
import 'package:cravely/features/auth/domain/repositories/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthImpl extends AuthRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthImpl(this._firebaseAuth, this._googleSignIn, this._firestore);

  CollectionReference get _userData => _firestore.collection('users');

  @override
  Stream<UserEntity?> get currentUser {
    return _firebaseAuth.authStateChanges().switchMap((user) async* {
      if (user == null) {
        logger.i('User is not signed in.');
        yield UserEntity.empty;
      } 
      
      else {
        try {
          final doc = await _userData
            .doc(user.uid)
            .get();

          // Check if the document exists in firestore
          if (!doc.exists || doc.data() == null) {
            yield UserEntity.empty;
          } 
          
          else {
            logger.i('User is signed in: ${user.email}');
            yield UserModel.fromJson(
              doc.data()! as Map<String, dynamic>
            );
          }
        } 
        
        catch (e) {
          yield UserEntity.empty;
        }
      }
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } 
    
    catch (e) {
      logger.e('Failed to sign in: $e');
      rethrow;
    }
  }

  @override
  Future<UserEntity> signUp(UserEntity user, String password) async {
    try {
      // get user 
      UserCredential userCredential = 
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email,
          password: password,
        );  

      // assign unique userId from firebase 
      final newUser = user.copyWith(
        userId: userCredential.user!.uid
      );

      // save user data to firestore
      await setUserData(newUser);

      return newUser;
    } 
    
    catch (e) {
      logger.e('Failed to sign up: $e');
      rethrow;
    }
  }

  @override
  Future<void> logOut() {
    try {
      return _firebaseAuth.signOut();
    } 
    
    catch (e) {
      logger.e('Failed to log out: $e');
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) {
    try {
      return _firebaseAuth.sendPasswordResetEmail(
        email: email
      );
    } 
    
    catch (e) {
      logger.e('Failed to reset password: $e');
      rethrow;
    }
  }

  @override
  Future<void> setUserData(UserEntity user) async {
    try {
      await _userData
        .doc(user.userId)
        .set(UserModel.fromEntity(user)
        .toJson());
    } 
    
    catch (e) {
      logger.e('Failed to set user data: $e');
      rethrow;
    }
  }

  // Apple is currently not available for now 
  @override
  Future<void> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    try {
      // 1. trigger google sign in popup
      final GoogleSignInAccount googleUser = 
        await _googleSignIn.authenticate();

      // 2. get auth details
      final GoogleSignInAuthentication googleAuth = 
        googleUser.authentication;

      // 3. create firebase credential
      final OAuthCredential credential = 
        GoogleAuthProvider.credential(
          accessToken: googleAuth.idToken,
          idToken: googleAuth.idToken,
        );

      // 4. sign in to firebase auth
      final UserCredential userCredential = 
        await _firebaseAuth.signInWithCredential(credential);

      final firebaseUser = userCredential.user!;

      // 5. check if user exists in Firestore
      final doc = await _userData
          .doc(firebaseUser.uid)
          .get();

      if (doc.exists) {
        return UserModel.fromJson(doc.data()! as Map<String, dynamic>);
      } 
      
      else {
        // new user - return partial entity with google data only
        // let the UI handle registration flow
        return UserEntity(
          userId: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          phoneNumber: 0,      
          isNewUser: true, 
        );
      }

    } 
    
    catch (e) {
      throw Exception('Google sign in failed: $e');
    }
  }

} 