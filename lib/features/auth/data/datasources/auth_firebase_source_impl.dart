import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/app_failure.dart';
import '../../../../core/typedefs/results.dart';
import '../models/user_model.dart';
import 'auth_firebase_source.dart';

class AuthFirebaseSourceImpl implements AuthFirebaseSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthFirebaseSourceImpl({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  }) : _firebaseAuth = firebaseAuth,
       _firestore = firestore;

  @override
  Future<Result<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      final userModel = UserModel(
        id: user.uid,
        email: user.email!,
        name: userDoc.data()?['name'] ?? '',
      );

      print('[LOGIN SUCCESS] ${userModel.toString()}');
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(
        AppFailure(message: e.message ?? 'Authentication failed', code: e.code),
      );
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error occurred'));
    }
  }

  @override
  Future<Result<UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;

      await _firestore.collection('users').doc(user.uid).set({
        'id': user.uid,
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      final userModel = UserModel(id: user.uid, email: email, name: name);

      print('[SIGNUP SUCCESS] ${userModel.toString()}');
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(
        AppFailure(message: e.message ?? 'Signup failed', code: e.code),
      );
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error occurred'));
    }
  }

  @override
  Stream<bool> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((user) => user != null);
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
