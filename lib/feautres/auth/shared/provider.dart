// auth_provider.dart
import 'package:ff_moneyblaster/feautres/auth/application/auth_notifier.dart';
import 'package:ff_moneyblaster/feautres/auth/application/auth_state.dart';
import 'package:ff_moneyblaster/services/auth_service.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(FirebaseAuthRepository()));

// final userStreamProvider = StreamProvider.autoDispose<Map<String, dynamic>>((ref) {
//   final currentUser = FirebaseAuth.instance.currentUser;
//   if (currentUser != null) {
//     return FirebaseFirestore.instance
//         .collection('users')
//         .doc(currentUser.uid)
//         .snapshots()
//         .map((snapshot) => snapshot.data()!);
//   } else {
//     return Stream.value({});
//   }
// });