import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/wallet/domain/qr_model.dart';

abstract class IWalletRepository {
  Future<bool> addTransactionToWallet(Map<String, dynamic> transaction);
  Future<UserModel> getUserModel();
  Future<List<QrModel>> getQrs();
  Future<List<UserModel>> getReferredUserList();
}
