// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    @Default('') String id,
    @Default('') String username,
    @Default('') String gameId,
    @Default('') String phoneNumber,
    @Default(false) bool isVerified,
    @Default([]) List<String?> tournamentIds,
    @Default('') String? referralCode,
    required GameStats gameStats,
    required WalletModel wallet,
    @Default('') String referredBy,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class GameStats with _$GameStats {
  @JsonSerializable()
  const factory GameStats(
      {required String game,
      @Default(0) int totalGames,
      @Default(0) int totalKills,
      @Default(0) int totalWins,
      @Default(0) int totalWinAmount,
      @Default(0) int totalEarned}) = _GameStats;

  factory GameStats.fromJson(Map<String, dynamic> json) =>
      _$GameStatsFromJson(json);
}

@freezed
class WalletModel with _$WalletModel {
  @JsonSerializable()
  const factory WalletModel({
    @Default(0) num balance,
    @Default(0.0) double adRevenue,
    @Default([]) List<TransactionHistory> history,
    @Default([]) List<BalanceStat> stats,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}

@freezed
class TransactionHistory with _$TransactionHistory {
  @JsonSerializable()
  const factory TransactionHistory({
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? datetime,
    @Default(0) int transaction,
    @Default('') String transactionStatus,
    @Default('') String transactionType,
    @Default('') String transactionId,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}

DateTime? _dateTimeFromTimestamp(Timestamp? timestamp) {
  return timestamp?.toDate();
}

Timestamp? _dateTimeToTimestamp(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}

@freezed
class BalanceStat with _$BalanceStat {
  @JsonSerializable()
  const factory BalanceStat({
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
    @Default(0.0) double transactionAmount,
    @Default('') String tournamentName,
    @Default(0.0) double balanceBefore,
  }) = _BalanceStat;

  factory BalanceStat.fromJson(Map<String, dynamic> json) =>
      _$BalanceStatFromJson(json);
}
