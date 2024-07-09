// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameTypeImpl _$$GameTypeImplFromJson(Map<String, dynamic> json) =>
    _$GameTypeImpl(
      gameCamera: json['gameCamera'] as String?,
      gameMap: json['gameMap'] as String?,
      teamOption: json['teamOption'] as String?,
    );

Map<String, dynamic> _$$GameTypeImplToJson(_$GameTypeImpl instance) =>
    <String, dynamic>{
      'gameCamera': instance.gameCamera,
      'gameMap': instance.gameMap,
      'teamOption': instance.teamOption,
    };

_$TournamentImpl _$$TournamentImplFromJson(Map<String, dynamic> json) =>
    _$TournamentImpl(
      createdAt: json['created_at'] as String?,
      dateTime: _dateTimeFromTimestamp(json['dateTime'] as Timestamp?),
      uid: json['uid'] as String?,
      entryFee: (json['entryFee'] as num?)?.toInt(),
      gameType: json['gameType'] == null
          ? null
          : GameType.fromJson(json['gameType'] as Map<String, dynamic>),
      gameOption: json['gameOption'] as String?,
      lastUpdatedAt: json['last_updated_at'] as String?,
      perKill: (json['perKill'] as num?)?.toInt(),
      prizePool: (json['prizePool'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      status:
          (json['status'] as List<dynamic>?)?.map((e) => e as String).toList(),
      totalPlayersAllowed: (json['totalPlayersAllowed'] as num?)?.toInt(),
      tournamentName: json['tournamentName'] as String?,
      bgImage: json['bgImage'] as String?,
      registeredPlayersId: (json['registeredPlayersId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lobby: json['lobby'] as String?,
      lobbyPassword: json['lobbyPassword'] as String?,
      liveLink: json['liveLink'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamsRegistered: (json['teamsRegistered'] as num?)?.toInt() ?? 0,
      teams: (json['teams'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : TeamModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TournamentImplToJson(_$TournamentImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'dateTime': _dateTimeToTimestamp(instance.dateTime),
      'uid': instance.uid,
      'entryFee': instance.entryFee,
      'gameType': instance.gameType,
      'gameOption': instance.gameOption,
      'last_updated_at': instance.lastUpdatedAt,
      'perKill': instance.perKill,
      'prizePool': instance.prizePool,
      'status': instance.status,
      'totalPlayersAllowed': instance.totalPlayersAllowed,
      'tournamentName': instance.tournamentName,
      'bgImage': instance.bgImage,
      'registeredPlayersId': instance.registeredPlayersId,
      'lobby': instance.lobby,
      'lobbyPassword': instance.lobbyPassword,
      'liveLink': instance.liveLink,
      'result': instance.result,
      'teamsRegistered': instance.teamsRegistered,
      'teams': instance.teams,
    };

_$TeamModelImpl _$$TeamModelImplFromJson(Map<String, dynamic> json) =>
    _$TeamModelImpl(
      registeredBy: json['registeredBy'] as String?,
      gameIds: (json['gameIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      teamNumber: (json['teamNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TeamModelImplToJson(_$TeamModelImpl instance) =>
    <String, dynamic>{
      'registeredBy': instance.registeredBy,
      'gameIds': instance.gameIds,
      'teamNumber': instance.teamNumber,
    };

_$ResultModelImpl _$$ResultModelImplFromJson(Map<String, dynamic> json) =>
    _$ResultModelImpl(
      playerGameId: json['playerGameId'] as String?,
      playerId: json['playerId'] as String?,
      playerKills: (json['playerKills'] as num?)?.toInt(),
      playerRank: (json['playerRank'] as num?)?.toInt(),
      playerUsername: json['playerUsername'] as String?,
    );

Map<String, dynamic> _$$ResultModelImplToJson(_$ResultModelImpl instance) =>
    <String, dynamic>{
      'playerGameId': instance.playerGameId,
      'playerId': instance.playerId,
      'playerKills': instance.playerKills,
      'playerRank': instance.playerRank,
      'playerUsername': instance.playerUsername,
    };
