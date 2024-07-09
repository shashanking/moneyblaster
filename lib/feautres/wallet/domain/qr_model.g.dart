// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrModelImpl _$$QrModelImplFromJson(Map<String, dynamic> json) =>
    _$QrModelImpl(
      uid: json['uid'] as String,
      qrImage: json['qrImage'] as String,
      upiId: json['upiId'] as String,
      isDefault: json['isDefault'] as bool,
      createdAt: json['createdAt'],
    );

Map<String, dynamic> _$$QrModelImplToJson(_$QrModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'qrImage': instance.qrImage,
      'upiId': instance.upiId,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt,
    };
