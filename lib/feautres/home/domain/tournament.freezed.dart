// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameType _$GameTypeFromJson(Map<String, dynamic> json) {
  return _GameType.fromJson(json);
}

/// @nodoc
mixin _$GameType {
  @JsonKey(name: 'gameCamera')
  String? get gameCamera => throw _privateConstructorUsedError;
  @JsonKey(name: 'gameMap')
  String? get gameMap => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamOption')
  String? get teamOption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameTypeCopyWith<GameType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameTypeCopyWith<$Res> {
  factory $GameTypeCopyWith(GameType value, $Res Function(GameType) then) =
      _$GameTypeCopyWithImpl<$Res, GameType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gameCamera') String? gameCamera,
      @JsonKey(name: 'gameMap') String? gameMap,
      @JsonKey(name: 'teamOption') String? teamOption});
}

/// @nodoc
class _$GameTypeCopyWithImpl<$Res, $Val extends GameType>
    implements $GameTypeCopyWith<$Res> {
  _$GameTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameCamera = freezed,
    Object? gameMap = freezed,
    Object? teamOption = freezed,
  }) {
    return _then(_value.copyWith(
      gameCamera: freezed == gameCamera
          ? _value.gameCamera
          : gameCamera // ignore: cast_nullable_to_non_nullable
              as String?,
      gameMap: freezed == gameMap
          ? _value.gameMap
          : gameMap // ignore: cast_nullable_to_non_nullable
              as String?,
      teamOption: freezed == teamOption
          ? _value.teamOption
          : teamOption // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameTypeImplCopyWith<$Res>
    implements $GameTypeCopyWith<$Res> {
  factory _$$GameTypeImplCopyWith(
          _$GameTypeImpl value, $Res Function(_$GameTypeImpl) then) =
      __$$GameTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gameCamera') String? gameCamera,
      @JsonKey(name: 'gameMap') String? gameMap,
      @JsonKey(name: 'teamOption') String? teamOption});
}

/// @nodoc
class __$$GameTypeImplCopyWithImpl<$Res>
    extends _$GameTypeCopyWithImpl<$Res, _$GameTypeImpl>
    implements _$$GameTypeImplCopyWith<$Res> {
  __$$GameTypeImplCopyWithImpl(
      _$GameTypeImpl _value, $Res Function(_$GameTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameCamera = freezed,
    Object? gameMap = freezed,
    Object? teamOption = freezed,
  }) {
    return _then(_$GameTypeImpl(
      gameCamera: freezed == gameCamera
          ? _value.gameCamera
          : gameCamera // ignore: cast_nullable_to_non_nullable
              as String?,
      gameMap: freezed == gameMap
          ? _value.gameMap
          : gameMap // ignore: cast_nullable_to_non_nullable
              as String?,
      teamOption: freezed == teamOption
          ? _value.teamOption
          : teamOption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameTypeImpl implements _GameType {
  _$GameTypeImpl(
      {@JsonKey(name: 'gameCamera') this.gameCamera,
      @JsonKey(name: 'gameMap') this.gameMap,
      @JsonKey(name: 'teamOption') this.teamOption});

  factory _$GameTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameTypeImplFromJson(json);

  @override
  @JsonKey(name: 'gameCamera')
  final String? gameCamera;
  @override
  @JsonKey(name: 'gameMap')
  final String? gameMap;
  @override
  @JsonKey(name: 'teamOption')
  final String? teamOption;

  @override
  String toString() {
    return 'GameType(gameCamera: $gameCamera, gameMap: $gameMap, teamOption: $teamOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameTypeImpl &&
            (identical(other.gameCamera, gameCamera) ||
                other.gameCamera == gameCamera) &&
            (identical(other.gameMap, gameMap) || other.gameMap == gameMap) &&
            (identical(other.teamOption, teamOption) ||
                other.teamOption == teamOption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameCamera, gameMap, teamOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameTypeImplCopyWith<_$GameTypeImpl> get copyWith =>
      __$$GameTypeImplCopyWithImpl<_$GameTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameTypeImplToJson(
      this,
    );
  }
}

abstract class _GameType implements GameType {
  factory _GameType(
      {@JsonKey(name: 'gameCamera') final String? gameCamera,
      @JsonKey(name: 'gameMap') final String? gameMap,
      @JsonKey(name: 'teamOption') final String? teamOption}) = _$GameTypeImpl;

  factory _GameType.fromJson(Map<String, dynamic> json) =
      _$GameTypeImpl.fromJson;

  @override
  @JsonKey(name: 'gameCamera')
  String? get gameCamera;
  @override
  @JsonKey(name: 'gameMap')
  String? get gameMap;
  @override
  @JsonKey(name: 'teamOption')
  String? get teamOption;
  @override
  @JsonKey(ignore: true)
  _$$GameTypeImplCopyWith<_$GameTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tournament _$TournamentFromJson(Map<String, dynamic> json) {
  return _Tournament.fromJson(json);
}

/// @nodoc
mixin _$Tournament {
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'dateTime',
      fromJson: _dateTimeFromTimestamp,
      toJson: _dateTimeToTimestamp)
  DateTime? get dateTime => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'entryFee')
  int? get entryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'gameType')
  GameType? get gameType => throw _privateConstructorUsedError;
  @JsonKey(name: 'gameOption')
  String? get gameOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated_at')
  String? get lastUpdatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'perKill')
  int? get perKill => throw _privateConstructorUsedError;
  @JsonKey(name: 'prizePool')
  List<int>? get prizePool => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  List<String>? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPlayersAllowed')
  int? get totalPlayersAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'tournamentName')
  String? get tournamentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bgImage')
  String? get bgImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'registeredPlayersId')
  List<String> get registeredPlayersId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lobby')
  String? get lobby => throw _privateConstructorUsedError;
  @JsonKey(name: 'lobbyPassword')
  String? get lobbyPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'liveLink')
  String? get liveLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  List<ResultModel?>? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamsRegistered')
  int get teamsRegistered => throw _privateConstructorUsedError;
  @JsonKey(name: 'teams')
  List<TeamModel?>? get teams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentCopyWith<Tournament> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentCopyWith<$Res> {
  factory $TournamentCopyWith(
          Tournament value, $Res Function(Tournament) then) =
      _$TournamentCopyWithImpl<$Res, Tournament>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(
          name: 'dateTime',
          fromJson: _dateTimeFromTimestamp,
          toJson: _dateTimeToTimestamp)
      DateTime? dateTime,
      String? uid,
      @JsonKey(name: 'entryFee') int? entryFee,
      @JsonKey(name: 'gameType') GameType? gameType,
      @JsonKey(name: 'gameOption') String? gameOption,
      @JsonKey(name: 'last_updated_at') String? lastUpdatedAt,
      @JsonKey(name: 'perKill') int? perKill,
      @JsonKey(name: 'prizePool') List<int>? prizePool,
      @JsonKey(name: 'status') List<String>? status,
      @JsonKey(name: 'totalPlayersAllowed') int? totalPlayersAllowed,
      @JsonKey(name: 'tournamentName') String? tournamentName,
      @JsonKey(name: 'bgImage') String? bgImage,
      @JsonKey(name: 'registeredPlayersId') List<String> registeredPlayersId,
      @JsonKey(name: 'lobby') String? lobby,
      @JsonKey(name: 'lobbyPassword') String? lobbyPassword,
      @JsonKey(name: 'liveLink') String? liveLink,
      @JsonKey(name: 'result') List<ResultModel?>? result,
      @JsonKey(name: 'teamsRegistered') int teamsRegistered,
      @JsonKey(name: 'teams') List<TeamModel?>? teams});

  $GameTypeCopyWith<$Res>? get gameType;
}

/// @nodoc
class _$TournamentCopyWithImpl<$Res, $Val extends Tournament>
    implements $TournamentCopyWith<$Res> {
  _$TournamentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? dateTime = freezed,
    Object? uid = freezed,
    Object? entryFee = freezed,
    Object? gameType = freezed,
    Object? gameOption = freezed,
    Object? lastUpdatedAt = freezed,
    Object? perKill = freezed,
    Object? prizePool = freezed,
    Object? status = freezed,
    Object? totalPlayersAllowed = freezed,
    Object? tournamentName = freezed,
    Object? bgImage = freezed,
    Object? registeredPlayersId = null,
    Object? lobby = freezed,
    Object? lobbyPassword = freezed,
    Object? liveLink = freezed,
    Object? result = freezed,
    Object? teamsRegistered = null,
    Object? teams = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      entryFee: freezed == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as int?,
      gameType: freezed == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as GameType?,
      gameOption: freezed == gameOption
          ? _value.gameOption
          : gameOption // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      perKill: freezed == perKill
          ? _value.perKill
          : perKill // ignore: cast_nullable_to_non_nullable
              as int?,
      prizePool: freezed == prizePool
          ? _value.prizePool
          : prizePool // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalPlayersAllowed: freezed == totalPlayersAllowed
          ? _value.totalPlayersAllowed
          : totalPlayersAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      tournamentName: freezed == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String?,
      bgImage: freezed == bgImage
          ? _value.bgImage
          : bgImage // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredPlayersId: null == registeredPlayersId
          ? _value.registeredPlayersId
          : registeredPlayersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyPassword: freezed == lobbyPassword
          ? _value.lobbyPassword
          : lobbyPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      liveLink: freezed == liveLink
          ? _value.liveLink
          : liveLink // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ResultModel?>?,
      teamsRegistered: null == teamsRegistered
          ? _value.teamsRegistered
          : teamsRegistered // ignore: cast_nullable_to_non_nullable
              as int,
      teams: freezed == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameTypeCopyWith<$Res>? get gameType {
    if (_value.gameType == null) {
      return null;
    }

    return $GameTypeCopyWith<$Res>(_value.gameType!, (value) {
      return _then(_value.copyWith(gameType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TournamentImplCopyWith<$Res>
    implements $TournamentCopyWith<$Res> {
  factory _$$TournamentImplCopyWith(
          _$TournamentImpl value, $Res Function(_$TournamentImpl) then) =
      __$$TournamentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(
          name: 'dateTime',
          fromJson: _dateTimeFromTimestamp,
          toJson: _dateTimeToTimestamp)
      DateTime? dateTime,
      String? uid,
      @JsonKey(name: 'entryFee') int? entryFee,
      @JsonKey(name: 'gameType') GameType? gameType,
      @JsonKey(name: 'gameOption') String? gameOption,
      @JsonKey(name: 'last_updated_at') String? lastUpdatedAt,
      @JsonKey(name: 'perKill') int? perKill,
      @JsonKey(name: 'prizePool') List<int>? prizePool,
      @JsonKey(name: 'status') List<String>? status,
      @JsonKey(name: 'totalPlayersAllowed') int? totalPlayersAllowed,
      @JsonKey(name: 'tournamentName') String? tournamentName,
      @JsonKey(name: 'bgImage') String? bgImage,
      @JsonKey(name: 'registeredPlayersId') List<String> registeredPlayersId,
      @JsonKey(name: 'lobby') String? lobby,
      @JsonKey(name: 'lobbyPassword') String? lobbyPassword,
      @JsonKey(name: 'liveLink') String? liveLink,
      @JsonKey(name: 'result') List<ResultModel?>? result,
      @JsonKey(name: 'teamsRegistered') int teamsRegistered,
      @JsonKey(name: 'teams') List<TeamModel?>? teams});

  @override
  $GameTypeCopyWith<$Res>? get gameType;
}

/// @nodoc
class __$$TournamentImplCopyWithImpl<$Res>
    extends _$TournamentCopyWithImpl<$Res, _$TournamentImpl>
    implements _$$TournamentImplCopyWith<$Res> {
  __$$TournamentImplCopyWithImpl(
      _$TournamentImpl _value, $Res Function(_$TournamentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? dateTime = freezed,
    Object? uid = freezed,
    Object? entryFee = freezed,
    Object? gameType = freezed,
    Object? gameOption = freezed,
    Object? lastUpdatedAt = freezed,
    Object? perKill = freezed,
    Object? prizePool = freezed,
    Object? status = freezed,
    Object? totalPlayersAllowed = freezed,
    Object? tournamentName = freezed,
    Object? bgImage = freezed,
    Object? registeredPlayersId = null,
    Object? lobby = freezed,
    Object? lobbyPassword = freezed,
    Object? liveLink = freezed,
    Object? result = freezed,
    Object? teamsRegistered = null,
    Object? teams = freezed,
  }) {
    return _then(_$TournamentImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      entryFee: freezed == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as int?,
      gameType: freezed == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as GameType?,
      gameOption: freezed == gameOption
          ? _value.gameOption
          : gameOption // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      perKill: freezed == perKill
          ? _value.perKill
          : perKill // ignore: cast_nullable_to_non_nullable
              as int?,
      prizePool: freezed == prizePool
          ? _value._prizePool
          : prizePool // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      status: freezed == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalPlayersAllowed: freezed == totalPlayersAllowed
          ? _value.totalPlayersAllowed
          : totalPlayersAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      tournamentName: freezed == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String?,
      bgImage: freezed == bgImage
          ? _value.bgImage
          : bgImage // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredPlayersId: null == registeredPlayersId
          ? _value._registeredPlayersId
          : registeredPlayersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyPassword: freezed == lobbyPassword
          ? _value.lobbyPassword
          : lobbyPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      liveLink: freezed == liveLink
          ? _value.liveLink
          : liveLink // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ResultModel?>?,
      teamsRegistered: null == teamsRegistered
          ? _value.teamsRegistered
          : teamsRegistered // ignore: cast_nullable_to_non_nullable
              as int,
      teams: freezed == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentImpl implements _Tournament {
  _$TournamentImpl(
      {@JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(
          name: 'dateTime',
          fromJson: _dateTimeFromTimestamp,
          toJson: _dateTimeToTimestamp)
      this.dateTime,
      required this.uid,
      @JsonKey(name: 'entryFee') this.entryFee,
      @JsonKey(name: 'gameType') this.gameType,
      @JsonKey(name: 'gameOption') this.gameOption,
      @JsonKey(name: 'last_updated_at') this.lastUpdatedAt,
      @JsonKey(name: 'perKill') this.perKill,
      @JsonKey(name: 'prizePool') final List<int>? prizePool,
      @JsonKey(name: 'status') final List<String>? status,
      @JsonKey(name: 'totalPlayersAllowed') this.totalPlayersAllowed,
      @JsonKey(name: 'tournamentName') this.tournamentName,
      @JsonKey(name: 'bgImage') this.bgImage,
      @JsonKey(name: 'registeredPlayersId')
      final List<String> registeredPlayersId = const [],
      @JsonKey(name: 'lobby') this.lobby,
      @JsonKey(name: 'lobbyPassword') this.lobbyPassword,
      @JsonKey(name: 'liveLink') this.liveLink,
      @JsonKey(name: 'result') final List<ResultModel?>? result,
      @JsonKey(name: 'teamsRegistered') this.teamsRegistered = 0,
      @JsonKey(name: 'teams') final List<TeamModel?>? teams = const []})
      : _prizePool = prizePool,
        _status = status,
        _registeredPlayersId = registeredPlayersId,
        _result = result,
        _teams = teams;

  factory _$TournamentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentImplFromJson(json);

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(
      name: 'dateTime',
      fromJson: _dateTimeFromTimestamp,
      toJson: _dateTimeToTimestamp)
  final DateTime? dateTime;
  @override
  final String? uid;
  @override
  @JsonKey(name: 'entryFee')
  final int? entryFee;
  @override
  @JsonKey(name: 'gameType')
  final GameType? gameType;
  @override
  @JsonKey(name: 'gameOption')
  final String? gameOption;
  @override
  @JsonKey(name: 'last_updated_at')
  final String? lastUpdatedAt;
  @override
  @JsonKey(name: 'perKill')
  final int? perKill;
  final List<int>? _prizePool;
  @override
  @JsonKey(name: 'prizePool')
  List<int>? get prizePool {
    final value = _prizePool;
    if (value == null) return null;
    if (_prizePool is EqualUnmodifiableListView) return _prizePool;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _status;
  @override
  @JsonKey(name: 'status')
  List<String>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'totalPlayersAllowed')
  final int? totalPlayersAllowed;
  @override
  @JsonKey(name: 'tournamentName')
  final String? tournamentName;
  @override
  @JsonKey(name: 'bgImage')
  final String? bgImage;
  final List<String> _registeredPlayersId;
  @override
  @JsonKey(name: 'registeredPlayersId')
  List<String> get registeredPlayersId {
    if (_registeredPlayersId is EqualUnmodifiableListView)
      return _registeredPlayersId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registeredPlayersId);
  }

  @override
  @JsonKey(name: 'lobby')
  final String? lobby;
  @override
  @JsonKey(name: 'lobbyPassword')
  final String? lobbyPassword;
  @override
  @JsonKey(name: 'liveLink')
  final String? liveLink;
  final List<ResultModel?>? _result;
  @override
  @JsonKey(name: 'result')
  List<ResultModel?>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'teamsRegistered')
  final int teamsRegistered;
  final List<TeamModel?>? _teams;
  @override
  @JsonKey(name: 'teams')
  List<TeamModel?>? get teams {
    final value = _teams;
    if (value == null) return null;
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Tournament(createdAt: $createdAt, dateTime: $dateTime, uid: $uid, entryFee: $entryFee, gameType: $gameType, gameOption: $gameOption, lastUpdatedAt: $lastUpdatedAt, perKill: $perKill, prizePool: $prizePool, status: $status, totalPlayersAllowed: $totalPlayersAllowed, tournamentName: $tournamentName, bgImage: $bgImage, registeredPlayersId: $registeredPlayersId, lobby: $lobby, lobbyPassword: $lobbyPassword, liveLink: $liveLink, result: $result, teamsRegistered: $teamsRegistered, teams: $teams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.entryFee, entryFee) ||
                other.entryFee == entryFee) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.gameOption, gameOption) ||
                other.gameOption == gameOption) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.perKill, perKill) || other.perKill == perKill) &&
            const DeepCollectionEquality()
                .equals(other._prizePool, _prizePool) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.totalPlayersAllowed, totalPlayersAllowed) ||
                other.totalPlayersAllowed == totalPlayersAllowed) &&
            (identical(other.tournamentName, tournamentName) ||
                other.tournamentName == tournamentName) &&
            (identical(other.bgImage, bgImage) || other.bgImage == bgImage) &&
            const DeepCollectionEquality()
                .equals(other._registeredPlayersId, _registeredPlayersId) &&
            (identical(other.lobby, lobby) || other.lobby == lobby) &&
            (identical(other.lobbyPassword, lobbyPassword) ||
                other.lobbyPassword == lobbyPassword) &&
            (identical(other.liveLink, liveLink) ||
                other.liveLink == liveLink) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.teamsRegistered, teamsRegistered) ||
                other.teamsRegistered == teamsRegistered) &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        dateTime,
        uid,
        entryFee,
        gameType,
        gameOption,
        lastUpdatedAt,
        perKill,
        const DeepCollectionEquality().hash(_prizePool),
        const DeepCollectionEquality().hash(_status),
        totalPlayersAllowed,
        tournamentName,
        bgImage,
        const DeepCollectionEquality().hash(_registeredPlayersId),
        lobby,
        lobbyPassword,
        liveLink,
        const DeepCollectionEquality().hash(_result),
        teamsRegistered,
        const DeepCollectionEquality().hash(_teams)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentImplCopyWith<_$TournamentImpl> get copyWith =>
      __$$TournamentImplCopyWithImpl<_$TournamentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentImplToJson(
      this,
    );
  }
}

abstract class _Tournament implements Tournament {
  factory _Tournament(
          {@JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(
              name: 'dateTime',
              fromJson: _dateTimeFromTimestamp,
              toJson: _dateTimeToTimestamp)
          final DateTime? dateTime,
          required final String? uid,
          @JsonKey(name: 'entryFee') final int? entryFee,
          @JsonKey(name: 'gameType') final GameType? gameType,
          @JsonKey(name: 'gameOption') final String? gameOption,
          @JsonKey(name: 'last_updated_at') final String? lastUpdatedAt,
          @JsonKey(name: 'perKill') final int? perKill,
          @JsonKey(name: 'prizePool') final List<int>? prizePool,
          @JsonKey(name: 'status') final List<String>? status,
          @JsonKey(name: 'totalPlayersAllowed') final int? totalPlayersAllowed,
          @JsonKey(name: 'tournamentName') final String? tournamentName,
          @JsonKey(name: 'bgImage') final String? bgImage,
          @JsonKey(name: 'registeredPlayersId')
          final List<String> registeredPlayersId,
          @JsonKey(name: 'lobby') final String? lobby,
          @JsonKey(name: 'lobbyPassword') final String? lobbyPassword,
          @JsonKey(name: 'liveLink') final String? liveLink,
          @JsonKey(name: 'result') final List<ResultModel?>? result,
          @JsonKey(name: 'teamsRegistered') final int teamsRegistered,
          @JsonKey(name: 'teams') final List<TeamModel?>? teams}) =
      _$TournamentImpl;

  factory _Tournament.fromJson(Map<String, dynamic> json) =
      _$TournamentImpl.fromJson;

  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(
      name: 'dateTime',
      fromJson: _dateTimeFromTimestamp,
      toJson: _dateTimeToTimestamp)
  DateTime? get dateTime;
  @override
  String? get uid;
  @override
  @JsonKey(name: 'entryFee')
  int? get entryFee;
  @override
  @JsonKey(name: 'gameType')
  GameType? get gameType;
  @override
  @JsonKey(name: 'gameOption')
  String? get gameOption;
  @override
  @JsonKey(name: 'last_updated_at')
  String? get lastUpdatedAt;
  @override
  @JsonKey(name: 'perKill')
  int? get perKill;
  @override
  @JsonKey(name: 'prizePool')
  List<int>? get prizePool;
  @override
  @JsonKey(name: 'status')
  List<String>? get status;
  @override
  @JsonKey(name: 'totalPlayersAllowed')
  int? get totalPlayersAllowed;
  @override
  @JsonKey(name: 'tournamentName')
  String? get tournamentName;
  @override
  @JsonKey(name: 'bgImage')
  String? get bgImage;
  @override
  @JsonKey(name: 'registeredPlayersId')
  List<String> get registeredPlayersId;
  @override
  @JsonKey(name: 'lobby')
  String? get lobby;
  @override
  @JsonKey(name: 'lobbyPassword')
  String? get lobbyPassword;
  @override
  @JsonKey(name: 'liveLink')
  String? get liveLink;
  @override
  @JsonKey(name: 'result')
  List<ResultModel?>? get result;
  @override
  @JsonKey(name: 'teamsRegistered')
  int get teamsRegistered;
  @override
  @JsonKey(name: 'teams')
  List<TeamModel?>? get teams;
  @override
  @JsonKey(ignore: true)
  _$$TournamentImplCopyWith<_$TournamentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) {
  return _TeamModel.fromJson(json);
}

/// @nodoc
mixin _$TeamModel {
  @JsonKey(name: 'registeredBy')
  String? get registeredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'gameIds')
  List<String> get gameIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamNumber')
  int? get teamNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamModelCopyWith<TeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamModelCopyWith<$Res> {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) then) =
      _$TeamModelCopyWithImpl<$Res, TeamModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'registeredBy') String? registeredBy,
      @JsonKey(name: 'gameIds') List<String> gameIds,
      @JsonKey(name: 'teamNumber') int? teamNumber});
}

/// @nodoc
class _$TeamModelCopyWithImpl<$Res, $Val extends TeamModel>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registeredBy = freezed,
    Object? gameIds = null,
    Object? teamNumber = freezed,
  }) {
    return _then(_value.copyWith(
      registeredBy: freezed == registeredBy
          ? _value.registeredBy
          : registeredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      gameIds: null == gameIds
          ? _value.gameIds
          : gameIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamNumber: freezed == teamNumber
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamModelImplCopyWith<$Res>
    implements $TeamModelCopyWith<$Res> {
  factory _$$TeamModelImplCopyWith(
          _$TeamModelImpl value, $Res Function(_$TeamModelImpl) then) =
      __$$TeamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'registeredBy') String? registeredBy,
      @JsonKey(name: 'gameIds') List<String> gameIds,
      @JsonKey(name: 'teamNumber') int? teamNumber});
}

/// @nodoc
class __$$TeamModelImplCopyWithImpl<$Res>
    extends _$TeamModelCopyWithImpl<$Res, _$TeamModelImpl>
    implements _$$TeamModelImplCopyWith<$Res> {
  __$$TeamModelImplCopyWithImpl(
      _$TeamModelImpl _value, $Res Function(_$TeamModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registeredBy = freezed,
    Object? gameIds = null,
    Object? teamNumber = freezed,
  }) {
    return _then(_$TeamModelImpl(
      registeredBy: freezed == registeredBy
          ? _value.registeredBy
          : registeredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      gameIds: null == gameIds
          ? _value._gameIds
          : gameIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamNumber: freezed == teamNumber
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamModelImpl implements _TeamModel {
  _$TeamModelImpl(
      {@JsonKey(name: 'registeredBy') this.registeredBy,
      @JsonKey(name: 'gameIds') final List<String> gameIds = const [],
      @JsonKey(name: 'teamNumber') this.teamNumber})
      : _gameIds = gameIds;

  factory _$TeamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamModelImplFromJson(json);

  @override
  @JsonKey(name: 'registeredBy')
  final String? registeredBy;
  final List<String> _gameIds;
  @override
  @JsonKey(name: 'gameIds')
  List<String> get gameIds {
    if (_gameIds is EqualUnmodifiableListView) return _gameIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameIds);
  }

  @override
  @JsonKey(name: 'teamNumber')
  final int? teamNumber;

  @override
  String toString() {
    return 'TeamModel(registeredBy: $registeredBy, gameIds: $gameIds, teamNumber: $teamNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamModelImpl &&
            (identical(other.registeredBy, registeredBy) ||
                other.registeredBy == registeredBy) &&
            const DeepCollectionEquality().equals(other._gameIds, _gameIds) &&
            (identical(other.teamNumber, teamNumber) ||
                other.teamNumber == teamNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, registeredBy,
      const DeepCollectionEquality().hash(_gameIds), teamNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamModelImplCopyWith<_$TeamModelImpl> get copyWith =>
      __$$TeamModelImplCopyWithImpl<_$TeamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamModelImplToJson(
      this,
    );
  }
}

abstract class _TeamModel implements TeamModel {
  factory _TeamModel(
      {@JsonKey(name: 'registeredBy') final String? registeredBy,
      @JsonKey(name: 'gameIds') final List<String> gameIds,
      @JsonKey(name: 'teamNumber') final int? teamNumber}) = _$TeamModelImpl;

  factory _TeamModel.fromJson(Map<String, dynamic> json) =
      _$TeamModelImpl.fromJson;

  @override
  @JsonKey(name: 'registeredBy')
  String? get registeredBy;
  @override
  @JsonKey(name: 'gameIds')
  List<String> get gameIds;
  @override
  @JsonKey(name: 'teamNumber')
  int? get teamNumber;
  @override
  @JsonKey(ignore: true)
  _$$TeamModelImplCopyWith<_$TeamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return _ResultModel.fromJson(json);
}

/// @nodoc
mixin _$ResultModel {
  @JsonKey(name: 'playerGameId')
  String? get playerGameId => throw _privateConstructorUsedError;
  @JsonKey(name: 'playerId')
  String? get playerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'playerKills')
  int? get playerKills => throw _privateConstructorUsedError;
  @JsonKey(name: 'playerRank')
  int? get playerRank => throw _privateConstructorUsedError;
  @JsonKey(name: 'playerUsername')
  String? get playerUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultModelCopyWith<ResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<$Res> {
  factory $ResultModelCopyWith(
          ResultModel value, $Res Function(ResultModel) then) =
      _$ResultModelCopyWithImpl<$Res, ResultModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'playerGameId') String? playerGameId,
      @JsonKey(name: 'playerId') String? playerId,
      @JsonKey(name: 'playerKills') int? playerKills,
      @JsonKey(name: 'playerRank') int? playerRank,
      @JsonKey(name: 'playerUsername') String? playerUsername});
}

/// @nodoc
class _$ResultModelCopyWithImpl<$Res, $Val extends ResultModel>
    implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerGameId = freezed,
    Object? playerId = freezed,
    Object? playerKills = freezed,
    Object? playerRank = freezed,
    Object? playerUsername = freezed,
  }) {
    return _then(_value.copyWith(
      playerGameId: freezed == playerGameId
          ? _value.playerGameId
          : playerGameId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerId: freezed == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerKills: freezed == playerKills
          ? _value.playerKills
          : playerKills // ignore: cast_nullable_to_non_nullable
              as int?,
      playerRank: freezed == playerRank
          ? _value.playerRank
          : playerRank // ignore: cast_nullable_to_non_nullable
              as int?,
      playerUsername: freezed == playerUsername
          ? _value.playerUsername
          : playerUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultModelImplCopyWith<$Res>
    implements $ResultModelCopyWith<$Res> {
  factory _$$ResultModelImplCopyWith(
          _$ResultModelImpl value, $Res Function(_$ResultModelImpl) then) =
      __$$ResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'playerGameId') String? playerGameId,
      @JsonKey(name: 'playerId') String? playerId,
      @JsonKey(name: 'playerKills') int? playerKills,
      @JsonKey(name: 'playerRank') int? playerRank,
      @JsonKey(name: 'playerUsername') String? playerUsername});
}

/// @nodoc
class __$$ResultModelImplCopyWithImpl<$Res>
    extends _$ResultModelCopyWithImpl<$Res, _$ResultModelImpl>
    implements _$$ResultModelImplCopyWith<$Res> {
  __$$ResultModelImplCopyWithImpl(
      _$ResultModelImpl _value, $Res Function(_$ResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerGameId = freezed,
    Object? playerId = freezed,
    Object? playerKills = freezed,
    Object? playerRank = freezed,
    Object? playerUsername = freezed,
  }) {
    return _then(_$ResultModelImpl(
      playerGameId: freezed == playerGameId
          ? _value.playerGameId
          : playerGameId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerId: freezed == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerKills: freezed == playerKills
          ? _value.playerKills
          : playerKills // ignore: cast_nullable_to_non_nullable
              as int?,
      playerRank: freezed == playerRank
          ? _value.playerRank
          : playerRank // ignore: cast_nullable_to_non_nullable
              as int?,
      playerUsername: freezed == playerUsername
          ? _value.playerUsername
          : playerUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultModelImpl implements _ResultModel {
  _$ResultModelImpl(
      {@JsonKey(name: 'playerGameId') this.playerGameId,
      @JsonKey(name: 'playerId') this.playerId,
      @JsonKey(name: 'playerKills') this.playerKills,
      @JsonKey(name: 'playerRank') this.playerRank,
      @JsonKey(name: 'playerUsername') this.playerUsername});

  factory _$ResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultModelImplFromJson(json);

  @override
  @JsonKey(name: 'playerGameId')
  final String? playerGameId;
  @override
  @JsonKey(name: 'playerId')
  final String? playerId;
  @override
  @JsonKey(name: 'playerKills')
  final int? playerKills;
  @override
  @JsonKey(name: 'playerRank')
  final int? playerRank;
  @override
  @JsonKey(name: 'playerUsername')
  final String? playerUsername;

  @override
  String toString() {
    return 'ResultModel(playerGameId: $playerGameId, playerId: $playerId, playerKills: $playerKills, playerRank: $playerRank, playerUsername: $playerUsername)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultModelImpl &&
            (identical(other.playerGameId, playerGameId) ||
                other.playerGameId == playerGameId) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerKills, playerKills) ||
                other.playerKills == playerKills) &&
            (identical(other.playerRank, playerRank) ||
                other.playerRank == playerRank) &&
            (identical(other.playerUsername, playerUsername) ||
                other.playerUsername == playerUsername));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, playerGameId, playerId,
      playerKills, playerRank, playerUsername);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultModelImplCopyWith<_$ResultModelImpl> get copyWith =>
      __$$ResultModelImplCopyWithImpl<_$ResultModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultModelImplToJson(
      this,
    );
  }
}

abstract class _ResultModel implements ResultModel {
  factory _ResultModel(
          {@JsonKey(name: 'playerGameId') final String? playerGameId,
          @JsonKey(name: 'playerId') final String? playerId,
          @JsonKey(name: 'playerKills') final int? playerKills,
          @JsonKey(name: 'playerRank') final int? playerRank,
          @JsonKey(name: 'playerUsername') final String? playerUsername}) =
      _$ResultModelImpl;

  factory _ResultModel.fromJson(Map<String, dynamic> json) =
      _$ResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'playerGameId')
  String? get playerGameId;
  @override
  @JsonKey(name: 'playerId')
  String? get playerId;
  @override
  @JsonKey(name: 'playerKills')
  int? get playerKills;
  @override
  @JsonKey(name: 'playerRank')
  int? get playerRank;
  @override
  @JsonKey(name: 'playerUsername')
  String? get playerUsername;
  @override
  @JsonKey(ignore: true)
  _$$ResultModelImplCopyWith<_$ResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
