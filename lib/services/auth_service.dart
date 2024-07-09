// firebase_auth_repository.dart

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_moneyblaster/core/utils/toast.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/i_auth_repository.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/auth/presentation/submit_otp_bottom_sheeet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _generateUniqueCode() {
    var now = DateTime.now().millisecondsSinceEpoch;

    var base36Encoded = now.toRadixString(36).toUpperCase();

    if (base36Encoded.length > 8) {
      base36Encoded = base36Encoded.substring(base36Encoded.length - 8);
    } else if (base36Encoded.length < 8) {
      int neededPadding = 8 - base36Encoded.length;
      var rng = Random();
      String padding = List.generate(neededPadding,
          (_) => rng.nextInt(36).toRadixString(36).toUpperCase()).join('');
      base36Encoded = padding + base36Encoded;
    }

    return base36Encoded;
  }

  Future<String> _generateUniqueReferralCode() async {
    String newCode = '';
    bool isUnique = false;

    while (!isUnique) {
      newCode = _generateUniqueCode();
      var existingCode = await _firestore
          .collection('usernames')
          .where('referralCode', isEqualTo: newCode)
          .get();

      if (existingCode.docs.isEmpty) {
        isUnique = true;
      }
    }

    return newCode;
  }

  @override
  Future<bool> signUpWithPhoneNumber({
    required String username,
    required String phoneNumber,

    required BuildContext context,
  }) async {
    try {
      var existingUsername =
          await _firestore.collection('usernames').doc(username).get();
      if (existingUsername.exists) {
        throw FirebaseAuthException(
          code: 'username-already-in-use',
          message: 'Username is already taken.',
        );
      }

      // Trigger the OTP verification
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91${phoneNumber.trim()}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Handle automatic verification (Android only)
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          showToastMessage(e.message ?? "");
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) {
          // Show the OTP dialog
          showSubmitOtpPopup(
            context,
            verificationId,
            phoneNumber,
            
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }
  @override
  Future<bool> signInWithPhoneNumber({
    required String phoneNumber,

    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91${phoneNumber.trim()}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          showToastMessage("${e.message}");
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) {
          // Show the OTP dialog
          showSubmitOtpPopup(
            context,
            verificationId,
            phoneNumber,
            
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      return true;
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
      showToastMessage("${e.message}");
      rethrow;
    }
  }

  @override
  Future<bool> signUpWithUsernameAndPassword({
    required String username,
    required String gameId,
    required String phoneNumber,
    required String password,
    required String gameOptionSelected,
    required String refferedBy,
  }) async {
    try {
      var existingEmail =
          await _firestore.collection('usernames').doc(username).get();
      if (existingEmail.exists) {
        throw FirebaseAuthException(
          code: 'username-already-in-use',
          message: 'Username is already taken.',
        );
      }

      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: '$username@moneyblaster.com',
        password: password,
      );

      final String referralCode = await _generateUniqueReferralCode();

      final UserModel user = UserModel(
        username: username,
        gameId: gameId,
        phoneNumber: phoneNumber,
        gameStats: GameStats(game: gameOptionSelected),
        wallet: const WalletModel(),
        id: userCredential.user!.uid,
        referralCode: referralCode,
      );

      Map<String, dynamic> data = {
        'username': user.username,
        'gameId': user.gameId,
        'phoneNumber': user.phoneNumber,
        'email': userCredential.user!.email,
        'isVerified': user.isVerified,
        'gameStats': user.gameStats.toJson(),
        'wallet': user.wallet.toJson(),
        'id': user.id,
        'referralCode': referralCode,
        'referredBy': refferedBy,
        'createdAt': DateTime.timestamp()
      };
      // print(data);

      await _firestore
          .collection('appusers')
          .doc(userCredential.user!.uid)
          .set(data);

      await _firestore.collection('usernames').doc(username).set({
        'userId': userCredential.user!.uid,
        'referralCode': referralCode,
      });

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  @override
  Future<bool> signInWithUsernameAndPassword(
      String username, String password) async {
    var email = await _getEmailForUsername(username);
    if (email == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No user found for that username.',
      );
    }

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // print('Sign-in successful.');
      return true;
    } catch (e) {
      // print('Sign-in failed: $e');
      return false;
    }
  }

  Future<String?> _getEmailForUsername(String username) async {
    if (username.isEmpty) {
      return null;
    }

    return "$username@moneyblaster.com";
  }

  @override
  Future<void> logout() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<bool> isUserVerified() async {
    try {
      var userDoc = await _firestore
          .collection('appusers')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (!userDoc.exists) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found with that username.',
        );
      }
      var isVerified = userDoc.data()?['isVerified'];
      return isVerified ?? false;
    } catch (e) {
      throw FirebaseAuthException(
        code: 'user-verification-error',
        message: 'Error occurred while verifying user.',
      );
    }
  }

  @override
  Future<UserModel> getUserModel() async {
    try {
      var userDoc = await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (!userDoc.exists) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found with that ID.',
        );
      }
      var userData = userDoc.data();
      if (userData == null) {
        throw FirebaseAuthException(
          code: 'data-not-found',
          message: 'User data is null.',
        );
      }

      return UserModel.fromJson(userData);
    } catch (e) {
      throw FirebaseAuthException(
        code: 'user-fetch-error',
        message: 'Error occurred while fetching user data: $e',
      );
    }
  }

  @override
  Future<void> verifyNumber(
      {required String number,
      BuildContext? context,
      VoidCallback? successCallBack}) async {
    // Use a TextEditingController to store the verification code
    TextEditingController smsCodeController = TextEditingController();

    // Request OTP verification for the provided phone number
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91${number.trim()}',
      verificationCompleted: (PhoneAuthCredential credential) {
        successCallBack?.call();
      },
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: 'Verifcation Failed');
        print('OTP Exception: $e');
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Handle code sent to the user's phone number, for manual verification
        // Save the verification ID for later use
        String? smsCode = await showDialog(
          context: context!,
          builder: (context) => AlertDialog(
            title: const Text('Enter OTP'),
            content: TextField(controller: smsCodeController),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, smsCodeController.text);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );

        // Create a PhoneAuthCredential using the verification ID and the user-entered OTP
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode!,
        );

        // Use the credential to verify the phone number
        await _firebaseAuth.signInWithCredential(credential);

        // After phone number verification is successful, you can proceed with signing in with email and password
        // signInWithEmailPassword(email, password);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle code auto-retrieval timeout, if necessary
      },
    );
  }
}
