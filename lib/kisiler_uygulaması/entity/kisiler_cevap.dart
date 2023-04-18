// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/entity/kisiler.dart';

class KisilerCevap {
  List<Kisiler> kisiler;
  int success;
  KisilerCevap({
    required this.kisiler,
    required this.success,
  });

  factory KisilerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["kisiler"] as List;
    List<Kisiler> kisiler = jsonArray.map((e) => Kisiler.fromJson(e)).toList();
    return KisilerCevap(kisiler: kisiler, success: json["success"] as int);
  }
}
