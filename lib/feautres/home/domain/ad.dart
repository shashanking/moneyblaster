import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad.freezed.dart';
part 'ad.g.dart';

@freezed
class Ad with _$Ad {
  const factory Ad({
    required String uid,
    required String? title,
    required String? description,
    required String imagePath,
    required String url,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'adDetails') @Default([]) List<AdDetails> adDetails,
  }) = _Ad;

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
}

@freezed
class AdDetails with _$AdDetails {
  const factory AdDetails({
    required String? userId,
    required int timesClicked,
  }) = _AdDetails;

  factory AdDetails.fromJson(Map<String, dynamic> json) =>
      _$AdDetailsFromJson(json);
}
