// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/cubit/kisi_kayit_cubit.dart';

class KisiKayitView extends StatefulWidget {
  const KisiKayitView({super.key});

  @override
  State<KisiKayitView> createState() => _KisiKayitViewState();
}

class _KisiKayitViewState extends State<KisiKayitView> {
  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi kayıt"),
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
                    context
                        .read<KisikayitCubit>()
                        .Kayit(tfKisiAd.text, tfKisiTel.text);
                  },
                  child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
