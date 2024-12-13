// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOrder _$ItemOrderFromJson(Map<String, dynamic> json) => ItemOrder(
      json['id'] as String?,
      json['address'] as String?,
      json['item'] as String?,
      json['phone'] as String?,
      json['transactionId'] as String?,
      json['customer'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['dateTime'] as String?,
    );

Map<String, dynamic> _$ItemOrderToJson(ItemOrder instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'customer': instance.customer,
      'item': instance.item,
      'phone': instance.phone,
      'price': instance.price,
      'transactionId': instance.transactionId,
      'dateTime': instance.dateTime,
    };
