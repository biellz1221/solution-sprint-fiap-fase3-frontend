// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:abc_tech_app/model/order_location.dart';

class Order {
  int operatorId;
  List<int> assists = [];
  OrderLocation? start;
  OrderLocation? end;

  Order({required this.operatorId, required this.assists, this.start, this.end});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operatorId': operatorId, //
      'assists': assists,
      'start': start?.toMap(),
      'end': end?.toMap()
    };
  }

  String toJson() => json.encode(toMap());
}
