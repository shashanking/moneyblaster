// auth_provider.dart
import 'package:ff_moneyblaster/feautres/home/application/home_notifier.dart';
import 'package:ff_moneyblaster/feautres/home/application/home_state.dart';
import 'package:ff_moneyblaster/services/home_service.dart';
import 'package:riverpod/riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
    (ref) => HomeNotifier(HomeRepository()));
