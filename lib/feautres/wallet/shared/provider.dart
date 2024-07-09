import 'package:ff_moneyblaster/feautres/wallet/application/user_wallet_state.dart';
import 'package:ff_moneyblaster/feautres/wallet/application/wallet_notifier.dart';
import 'package:ff_moneyblaster/services/wallet_service.dart';
import 'package:riverpod/riverpod.dart';

final walletProvider = StateNotifierProvider<WalletNotifier, UserWalletState>(
    (ref) => WalletNotifier(WalletRepository()));
