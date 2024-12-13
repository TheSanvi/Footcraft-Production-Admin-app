import 'package:json_annotation/json_annotation.dart';
part 'item_order.g.dart';

@JsonSerializable()
class ItemOrder {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "customer")
  String? customer;

  @JsonKey(name: "item")
  String? item;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "transactionId")
  String? transactionId;

  @JsonKey(name: "dateTime")
  String? dateTime;




  ItemOrder(
      this.id,
      this.address,
      this.item,
      this.phone,
      this.transactionId,
      this.customer,
      this.price,
      this.dateTime
      );

  factory ItemOrder.fromJson(Map<String, dynamic> json) => _$ItemOrderFromJson(json);
  Map<String, dynamic> toJson() => _$ItemOrderToJson(this);
}
