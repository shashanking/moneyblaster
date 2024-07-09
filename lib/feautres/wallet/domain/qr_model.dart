import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_model.freezed.dart';
part 'qr_model.g.dart';

@freezed
class QrModel with _$QrModel {
  @JsonSerializable(explicitToJson: true)
  const factory QrModel({
    required String uid,
    required String qrImage,
    required String upiId,
    required bool isDefault,
    dynamic createdAt,
  }) = _QrModel;

  factory QrModel.fromJson(Map<String, dynamic> json) =>
      _$QrModelFromJson(json);
}
