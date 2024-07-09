// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get gameId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  List<String?> get tournamentIds => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;
  GameStats get gameStats => throw _privateConstructorUsedError;
  WalletModel get wallet => throw _privateConstructorUsedError;
  String get referredBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      String gameId,
      String phoneNumber,
      bool isVerified,
      List<String?> tournamentIds,
      String? referralCode,
      GameStats gameStats,
      WalletModel wallet,
      String referredBy});

  $GameStatsCopyWith<$Res> get gameStats;
  $WalletModelCopyWith<$Res> get wallet;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? gameId = null,
    Object? phoneNumber = null,
    Object? isVerified = null,
    Object? tournamentIds = null,
    Object? referralCode = freezed,
    Object? gameStats = null,
    Object? wallet = null,
    Object? referredBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      tournamentIds: null == tournamentIds
          ? _value.tournamentIds
          : tournamentIds // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      gameStats: null == gameStats
          ? _value.gameStats
          : gameStats // ignore: cast_nullable_to_non_nullable
              as GameStats,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameStatsCopyWith<$Res> get gameStats {
    return $GameStatsCopyWith<$Res>(_value.gameStats, (value) {
      return _then(_value.copyWith(gameStats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res> get wallet {
    return $WalletModelCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String gameId,
      String phoneNumber,
      bool isVerified,
      List<String?> tournamentIds,
      String? referralCode,
      GameStats gameStats,
      WalletModel wallet,
      String referredBy});

  @override
  $GameStatsCopyWith<$Res> get gameStats;
  @override
  $WalletModelCopyWith<$Res> get wallet;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? gameId = null,
    Object? phoneNumber = null,
    Object? isVerified = null,
    Object? tournamentIds = null,
    Object? referralCode = freezed,
    Object? gameStats = null,
    Object? wallet = null,
    Object? referredBy = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      tournamentIds: null == tournamentIds
          ? _value._tournamentIds
          : tournamentIds // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      gameStats: null == gameStats
          ? _value.gameStats
          : gameStats // ignore: cast_nullable_to_non_nullable
              as GameStats,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  const _$UserModelImpl(
      {this.id = '',
      this.username = '',
      this.gameId = '',
      this.phoneNumber = '',
      this.isVerified = false,
      final List<String?> tournamentIds = const [],
      this.referralCode = '',
      required this.gameStats,
      required this.wallet,
      this.referredBy = ''})
      : _tournamentIds = tournamentIds;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String gameId;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final bool isVerified;
  final List<String?> _tournamentIds;
  @override
  @JsonKey()
  List<String?> get tournamentIds {
    if (_tournamentIds is EqualUnmodifiableListView) return _tournamentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tournamentIds);
  }

  @override
  @JsonKey()
  final String? referralCode;
  @override
  final GameStats gameStats;
  @override
  final WalletModel wallet;
  @override
  @JsonKey()
  final String referredBy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, username: $username, gameId: $gameId, phoneNumber: $phoneNumber, isVerified: $isVerified, tournamentIds: $tournamentIds, referralCode: $referralCode, gameStats: $gameStats, wallet: $wallet, referredBy: $referredBy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('gameId', gameId))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('tournamentIds', tournamentIds))
      ..add(DiagnosticsProperty('referralCode', referralCode))
      ..add(DiagnosticsProperty('gameStats', gameStats))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('referredBy', referredBy));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality()
                .equals(other._tournamentIds, _tournamentIds) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.gameStats, gameStats) ||
                other.gameStats == gameStats) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      gameId,
      phoneNumber,
      isVerified,
      const DeepCollectionEquality().hash(_tournamentIds),
      referralCode,
      gameStats,
      wallet,
      referredBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String id,
      final String username,
      final String gameId,
      final String phoneNumber,
      final bool isVerified,
      final List<String?> tournamentIds,
      final String? referralCode,
      required final GameStats gameStats,
      required final WalletModel wallet,
      final String referredBy}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get gameId;
  @override
  String get phoneNumber;
  @override
  bool get isVerified;
  @override
  List<String?> get tournamentIds;
  @override
  String? get referralCode;
  @override
  GameStats get gameStats;
  @override
  WalletModel get wallet;
  @override
  String get referredBy;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameStats _$GameStatsFromJson(Map<String, dynamic> json) {
  return _GameStats.fromJson(json);
}

/// @nodoc
mixin _$GameStats {
  String get game => throw _privateConstructorUsedError;
  int get totalGames => throw _privateConstructorUsedError;
  int get totalKills => throw _privateConstructorUsedError;
  int get totalWins => throw _privateConstructorUsedError;
  int get totalWinAmount => throw _privateConstructorUsedError;
  int get totalEarned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStatsCopyWith<GameStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStatsCopyWith<$Res> {
  factory $GameStatsCopyWith(GameStats value, $Res Function(GameStats) then) =
      _$GameStatsCopyWithImpl<$Res, GameStats>;
  @useResult
  $Res call(
      {String game,
      int totalGames,
      int totalKills,
      int totalWins,
      int totalWinAmount,
      int totalEarned});
}

/// @nodoc
class _$GameStatsCopyWithImpl<$Res, $Val extends GameStats>
    implements $GameStatsCopyWith<$Res> {
  _$GameStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? totalGames = null,
    Object? totalKills = null,
    Object? totalWins = null,
    Object? totalWinAmount = null,
    Object? totalEarned = null,
  }) {
    return _then(_value.copyWith(
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      totalGames: null == totalGames
          ? _value.totalGames
          : totalGames // ignore: cast_nullable_to_non_nullable
              as int,
      totalKills: null == totalKills
          ? _value.totalKills
          : totalKills // ignore: cast_nullable_to_non_nullable
              as int,
      totalWins: null == totalWins
          ? _value.totalWins
          : totalWins // ignore: cast_nullable_to_non_nullable
              as int,
      totalWinAmount: null == totalWinAmount
          ? _value.totalWinAmount
          : totalWinAmount // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarned: null == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStatsImplCopyWith<$Res>
    implements $GameStatsCopyWith<$Res> {
  factory _$$GameStatsImplCopyWith(
          _$GameStatsImpl value, $Res Function(_$GameStatsImpl) then) =
      __$$GameStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String game,
      int totalGames,
      int totalKills,
      int totalWins,
      int totalWinAmount,
      int totalEarned});
}

/// @nodoc
class __$$GameStatsImplCopyWithImpl<$Res>
    extends _$GameStatsCopyWithImpl<$Res, _$GameStatsImpl>
    implements _$$GameStatsImplCopyWith<$Res> {
  __$$GameStatsImplCopyWithImpl(
      _$GameStatsImpl _value, $Res Function(_$GameStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? totalGames = null,
    Object? totalKills = null,
    Object? totalWins = null,
    Object? totalWinAmount = null,
    Object? totalEarned = null,
  }) {
    return _then(_$GameStatsImpl(
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      totalGames: null == totalGames
          ? _value.totalGames
          : totalGames // ignore: cast_nullable_to_non_nullable
              as int,
      totalKills: null == totalKills
          ? _value.totalKills
          : totalKills // ignore: cast_nullable_to_non_nullable
              as int,
      totalWins: null == totalWins
          ? _value.totalWins
          : totalWins // ignore: cast_nullable_to_non_nullable
              as int,
      totalWinAmount: null == totalWinAmount
          ? _value.totalWinAmount
          : totalWinAmount // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarned: null == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$GameStatsImpl with DiagnosticableTreeMixin implements _GameStats {
  const _$GameStatsImpl(
      {required this.game,
      this.totalGames = 0,
      this.totalKills = 0,
      this.totalWins = 0,
      this.totalWinAmount = 0,
      this.totalEarned = 0});

  factory _$GameStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStatsImplFromJson(json);

  @override
  final String game;
  @override
  @JsonKey()
  final int totalGames;
  @override
  @JsonKey()
  final int totalKills;
  @override
  @JsonKey()
  final int totalWins;
  @override
  @JsonKey()
  final int totalWinAmount;
  @override
  @JsonKey()
  final int totalEarned;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameStats(game: $game, totalGames: $totalGames, totalKills: $totalKills, totalWins: $totalWins, totalWinAmount: $totalWinAmount, totalEarned: $totalEarned)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameStats'))
      ..add(DiagnosticsProperty('game', game))
      ..add(DiagnosticsProperty('totalGames', totalGames))
      ..add(DiagnosticsProperty('totalKills', totalKills))
      ..add(DiagnosticsProperty('totalWins', totalWins))
      ..add(DiagnosticsProperty('totalWinAmount', totalWinAmount))
      ..add(DiagnosticsProperty('totalEarned', totalEarned));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStatsImpl &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.totalGames, totalGames) ||
                other.totalGames == totalGames) &&
            (identical(other.totalKills, totalKills) ||
                other.totalKills == totalKills) &&
            (identical(other.totalWins, totalWins) ||
                other.totalWins == totalWins) &&
            (identical(other.totalWinAmount, totalWinAmount) ||
                other.totalWinAmount == totalWinAmount) &&
            (identical(other.totalEarned, totalEarned) ||
                other.totalEarned == totalEarned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, game, totalGames, totalKills,
      totalWins, totalWinAmount, totalEarned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStatsImplCopyWith<_$GameStatsImpl> get copyWith =>
      __$$GameStatsImplCopyWithImpl<_$GameStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStatsImplToJson(
      this,
    );
  }
}

abstract class _GameStats implements GameStats {
  const factory _GameStats(
      {required final String game,
      final int totalGames,
      final int totalKills,
      final int totalWins,
      final int totalWinAmount,
      final int totalEarned}) = _$GameStatsImpl;

  factory _GameStats.fromJson(Map<String, dynamic> json) =
      _$GameStatsImpl.fromJson;

  @override
  String get game;
  @override
  int get totalGames;
  @override
  int get totalKills;
  @override
  int get totalWins;
  @override
  int get totalWinAmount;
  @override
  int get totalEarned;
  @override
  @JsonKey(ignore: true)
  _$$GameStatsImplCopyWith<_$GameStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  num get balance => throw _privateConstructorUsedError;
  double get adRevenue => throw _privateConstructorUsedError;
  List<TransactionHistory> get history => throw _privateConstructorUsedError;
  List<BalanceStat> get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {num balance,
      double adRevenue,
      List<TransactionHistory> history,
      List<BalanceStat> stats});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? adRevenue = null,
    Object? history = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      adRevenue: null == adRevenue
          ? _value.adRevenue
          : adRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<BalanceStat>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
          _$WalletModelImpl value, $Res Function(_$WalletModelImpl) then) =
      __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num balance,
      double adRevenue,
      List<TransactionHistory> history,
      List<BalanceStat> stats});
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
      _$WalletModelImpl _value, $Res Function(_$WalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? adRevenue = null,
    Object? history = null,
    Object? stats = null,
  }) {
    return _then(_$WalletModelImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      adRevenue: null == adRevenue
          ? _value.adRevenue
          : adRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<BalanceStat>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$WalletModelImpl with DiagnosticableTreeMixin implements _WalletModel {
  const _$WalletModelImpl(
      {this.balance = 0,
      this.adRevenue = 0.0,
      final List<TransactionHistory> history = const [],
      final List<BalanceStat> stats = const []})
      : _history = history,
        _stats = stats;

  factory _$WalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletModelImplFromJson(json);

  @override
  @JsonKey()
  final num balance;
  @override
  @JsonKey()
  final double adRevenue;
  final List<TransactionHistory> _history;
  @override
  @JsonKey()
  List<TransactionHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  final List<BalanceStat> _stats;
  @override
  @JsonKey()
  List<BalanceStat> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletModel(balance: $balance, adRevenue: $adRevenue, history: $history, stats: $stats)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletModel'))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('adRevenue', adRevenue))
      ..add(DiagnosticsProperty('history', history))
      ..add(DiagnosticsProperty('stats', stats));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.adRevenue, adRevenue) ||
                other.adRevenue == adRevenue) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality().equals(other._stats, _stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      balance,
      adRevenue,
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_stats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletModelImplToJson(
      this,
    );
  }
}

abstract class _WalletModel implements WalletModel {
  const factory _WalletModel(
      {final num balance,
      final double adRevenue,
      final List<TransactionHistory> history,
      final List<BalanceStat> stats}) = _$WalletModelImpl;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$WalletModelImpl.fromJson;

  @override
  num get balance;
  @override
  double get adRevenue;
  @override
  List<TransactionHistory> get history;
  @override
  List<BalanceStat> get stats;
  @override
  @JsonKey(ignore: true)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get datetime => throw _privateConstructorUsedError;
  int get transaction => throw _privateConstructorUsedError;
  String get transactionStatus => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? datetime,
      int transaction,
      String transactionStatus,
      String transactionType,
      String transactionId});
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = freezed,
    Object? transaction = null,
    Object? transactionStatus = null,
    Object? transactionType = null,
    Object? transactionId = null,
  }) {
    return _then(_value.copyWith(
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionHistoryImplCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$TransactionHistoryImplCopyWith(_$TransactionHistoryImpl value,
          $Res Function(_$TransactionHistoryImpl) then) =
      __$$TransactionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? datetime,
      int transaction,
      String transactionStatus,
      String transactionType,
      String transactionId});
}

/// @nodoc
class __$$TransactionHistoryImplCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$TransactionHistoryImpl>
    implements _$$TransactionHistoryImplCopyWith<$Res> {
  __$$TransactionHistoryImplCopyWithImpl(_$TransactionHistoryImpl _value,
      $Res Function(_$TransactionHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = freezed,
    Object? transaction = null,
    Object? transactionStatus = null,
    Object? transactionType = null,
    Object? transactionId = null,
  }) {
    return _then(_$TransactionHistoryImpl(
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$TransactionHistoryImpl
    with DiagnosticableTreeMixin
    implements _TransactionHistory {
  const _$TransactionHistoryImpl(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.datetime,
      this.transaction = 0,
      this.transactionStatus = '',
      this.transactionType = '',
      this.transactionId = ''});

  factory _$TransactionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryImplFromJson(json);

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? datetime;
  @override
  @JsonKey()
  final int transaction;
  @override
  @JsonKey()
  final String transactionStatus;
  @override
  @JsonKey()
  final String transactionType;
  @override
  @JsonKey()
  final String transactionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionHistory(datetime: $datetime, transaction: $transaction, transactionStatus: $transactionStatus, transactionType: $transactionType, transactionId: $transactionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionHistory'))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('transaction', transaction))
      ..add(DiagnosticsProperty('transactionStatus', transactionStatus))
      ..add(DiagnosticsProperty('transactionType', transactionType))
      ..add(DiagnosticsProperty('transactionId', transactionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, datetime, transaction,
      transactionStatus, transactionType, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      __$$TransactionHistoryImplCopyWithImpl<_$TransactionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryImplToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  const factory _TransactionHistory(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      final DateTime? datetime,
      final int transaction,
      final String transactionStatus,
      final String transactionType,
      final String transactionId}) = _$TransactionHistoryImpl;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryImpl.fromJson;

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get datetime;
  @override
  int get transaction;
  @override
  String get transactionStatus;
  @override
  String get transactionType;
  @override
  String get transactionId;
  @override
  @JsonKey(ignore: true)
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BalanceStat _$BalanceStatFromJson(Map<String, dynamic> json) {
  return _BalanceStat.fromJson(json);
}

/// @nodoc
mixin _$BalanceStat {
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  double get transactionAmount => throw _privateConstructorUsedError;
  String get tournamentName => throw _privateConstructorUsedError;
  double get balanceBefore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceStatCopyWith<BalanceStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceStatCopyWith<$Res> {
  factory $BalanceStatCopyWith(
          BalanceStat value, $Res Function(BalanceStat) then) =
      _$BalanceStatCopyWithImpl<$Res, BalanceStat>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? createdAt,
      double transactionAmount,
      String tournamentName,
      double balanceBefore});
}

/// @nodoc
class _$BalanceStatCopyWithImpl<$Res, $Val extends BalanceStat>
    implements $BalanceStatCopyWith<$Res> {
  _$BalanceStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? transactionAmount = null,
    Object? tournamentName = null,
    Object? balanceBefore = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tournamentName: null == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceStatImplCopyWith<$Res>
    implements $BalanceStatCopyWith<$Res> {
  factory _$$BalanceStatImplCopyWith(
          _$BalanceStatImpl value, $Res Function(_$BalanceStatImpl) then) =
      __$$BalanceStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? createdAt,
      double transactionAmount,
      String tournamentName,
      double balanceBefore});
}

/// @nodoc
class __$$BalanceStatImplCopyWithImpl<$Res>
    extends _$BalanceStatCopyWithImpl<$Res, _$BalanceStatImpl>
    implements _$$BalanceStatImplCopyWith<$Res> {
  __$$BalanceStatImplCopyWithImpl(
      _$BalanceStatImpl _value, $Res Function(_$BalanceStatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? transactionAmount = null,
    Object? tournamentName = null,
    Object? balanceBefore = null,
  }) {
    return _then(_$BalanceStatImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tournamentName: null == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$BalanceStatImpl with DiagnosticableTreeMixin implements _BalanceStat {
  const _$BalanceStatImpl(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.createdAt,
      this.transactionAmount = 0.0,
      this.tournamentName = '',
      this.balanceBefore = 0.0});

  factory _$BalanceStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceStatImplFromJson(json);

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey()
  final double transactionAmount;
  @override
  @JsonKey()
  final String tournamentName;
  @override
  @JsonKey()
  final double balanceBefore;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BalanceStat(createdAt: $createdAt, transactionAmount: $transactionAmount, tournamentName: $tournamentName, balanceBefore: $balanceBefore)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BalanceStat'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('transactionAmount', transactionAmount))
      ..add(DiagnosticsProperty('tournamentName', tournamentName))
      ..add(DiagnosticsProperty('balanceBefore', balanceBefore));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceStatImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.transactionAmount, transactionAmount) ||
                other.transactionAmount == transactionAmount) &&
            (identical(other.tournamentName, tournamentName) ||
                other.tournamentName == tournamentName) &&
            (identical(other.balanceBefore, balanceBefore) ||
                other.balanceBefore == balanceBefore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createdAt, transactionAmount, tournamentName, balanceBefore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceStatImplCopyWith<_$BalanceStatImpl> get copyWith =>
      __$$BalanceStatImplCopyWithImpl<_$BalanceStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceStatImplToJson(
      this,
    );
  }
}

abstract class _BalanceStat implements BalanceStat {
  const factory _BalanceStat(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      final DateTime? createdAt,
      final double transactionAmount,
      final String tournamentName,
      final double balanceBefore}) = _$BalanceStatImpl;

  factory _BalanceStat.fromJson(Map<String, dynamic> json) =
      _$BalanceStatImpl.fromJson;

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  double get transactionAmount;
  @override
  String get tournamentName;
  @override
  double get balanceBefore;
  @override
  @JsonKey(ignore: true)
  _$$BalanceStatImplCopyWith<_$BalanceStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
