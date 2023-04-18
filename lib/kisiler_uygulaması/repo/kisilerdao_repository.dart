import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/entity/kisiler.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/entity/kisiler_cevap.dart';

class KisilerDaoRepository {
  List<Kisiler> parseKisilerCevap(String cevap) {
    return KisilerCevap.fromJson(jsonDecode(cevap)).kisiler;
  }

  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("kişi ekle : ${cevap.data.toString()} ");
  }

  Future<void> kisiGuncelle(
      int kisi_id, String kisi_ad, String kisi_tel) async {
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id": kisi_id, "kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("kişi güncelle : ${cevap.data.toString()} ");
  }

  Future<List<Kisiler>> tumKisileriGetir() async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad": aramaKelimesi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<void> kisiSil(int kisi_id) async {
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id": kisi_id};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("kişi silk : ${cevap.data.toString()} ");
  }
}
