import 'package:ff_moneyblaster/feautres/home/domain/tournament.dart';

abstract class IHomeRepository {
  Future<List<Tournament>> getTournaments();
  Future<Tournament> registerForTournament(
      {required String tournamentId, List<String>? squadPlayerIds});
  Future<void> drawWallet({required int val});
}
