import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ff_moneyblaster/feautres/home/domain/i_home_repository.dart';
import 'package:ff_moneyblaster/feautres/home/domain/tournament.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeRepository implements IHomeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<List<Tournament>> getTournaments() async {
    var collection = FirebaseFirestore.instance.collection('tournaments');
    var snapshot = await collection.get();

    return snapshot.docs.map((doc) => Tournament.fromJson(doc.data())).toList();
  }

  @override
  Future<Tournament> registerForTournament(
      {required String tournamentId, List<String>? squadPlayerIds}) async {
    final id = _auth.currentUser!.uid;
    var tournamentRef =
        FirebaseFirestore.instance.collection('tournaments').doc(tournamentId);
    var userRef = FirebaseFirestore.instance.collection('appusers').doc(id);

    final tournamentDetails = await tournamentRef.get();
    final userDetails = await userRef.get();

    Map<String, dynamic> userData = userDetails.data() as Map<String, dynamic>;

    final gameId = userDetails["gameId"];

    Map<String, dynamic> data =
        tournamentDetails.data() as Map<String, dynamic>;
    final teamsRegistered = data["teamsRegistered"] ?? 0;
    final totalPlayersAllowed = data["totalPlayersAllowed"];
    final isSquad = data["gameType"]["teamOption"] == 'SQUAD';
    final isTDM = data["gameType"]["teamOption"] == 'TDM';
    final gameName = data['gameOption'];
    bool isRoomFull = false;

    if (tournamentDetails.exists) {
      if (isSquad || isTDM) {
        // to execute if squad

        if (squadPlayerIds == null || squadPlayerIds.isEmpty) {
          Fluttertoast.showToast(msg: 'Please enter squad player ids');
        } else if (teamsRegistered >= 12 && gameName == 'FREE FIRE') {
          isRoomFull = true;
          Fluttertoast.showToast(msg: 'Room already full');
        } else if (teamsRegistered >= 24 && gameName == 'BGMI') {
          isRoomFull = true;
          Fluttertoast.showToast(msg: 'Room already full');
        } else if (teamsRegistered >= 2 && isTDM) {
          isRoomFull = true;
          Fluttertoast.showToast(msg: 'Room already full');
        } else {
          final team = TeamModel(
            gameIds: [...squadPlayerIds, gameId],
            registeredBy: id,
            teamNumber: teamsRegistered + 1,
          );

          await tournamentRef.update({
            'registeredPlayersId': FieldValue.arrayUnion([id]),
            'teams': FieldValue.arrayUnion([team.toJson()]),
            'teamsRegistered': teamsRegistered + 1,
            // 'isRoomFull': isRoomFull,
          });

          Fluttertoast.showToast(msg: 'Your team has been created.');
        }
      } else {
        // to execute if solo
        final val = data['registeredPlayersId'] ?? [];
        if (val.length < totalPlayersAllowed) {
          await tournamentRef.update({
            'registeredPlayersId': FieldValue.arrayUnion([id])
          });
        } else {
          Fluttertoast.showToast(msg: 'Room already full');
        }
      }
    }

    // Fetch the updated tournament data
    var snapshot = await tournamentRef.get();
    var tournamentData = snapshot.data();

    // Convert the tournament data to a Tournament object
    return Tournament.fromJson(tournamentData!);
  }

  @override
  Future<void> drawWallet({required int val}) async {
    final uid = _auth.currentUser!.uid;
    final ref = _firestore.collection('appusers').doc(uid);
    DocumentSnapshot documentSnapshot = await ref.get();
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      final vig = data['wallet']['balance'];

      data['wallet']['balance'] = (vig - val);
      await ref.update(data);
    }
  }
}
