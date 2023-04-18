// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, must_be_immutable, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/cubit/kisi_detay_cubit.dart';

import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/entity/kisiler.dart';

class KisiDetayView extends StatefulWidget {
  Kisiler kisi;
  KisiDetayView({
    Key? key,
    required this.kisi,
  }) : super(key: key);

  @override
  State<KisiDetayView> createState() => _KisiDetayViewState();
}

class _KisiDetayViewState extends State<KisiDetayView> {
  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAd.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  controller: tfKisiAd,
                  decoration: const InputDecoration(hintText: "Kişi Ad")),
              TextField(
                  controller: tfKisiTel,
                  decoration: const InputDecoration(hintText: "Kişi Telefon")),
              ElevatedButton(
                  onPressed: () {
                    context.read<KisiDetayCubit>().guncelle(
                        int.parse(widget.kisi.kisi_id),
                        tfKisiAd.text,
                        tfKisiTel.text);
                  },
                  child: const Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
