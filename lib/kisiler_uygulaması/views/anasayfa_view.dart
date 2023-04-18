// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/cubit/anasayfa_cubit.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/entity/kisiler.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/views/kisi_detay_sayfa.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/views/kisi_kayit_sayfa.dart';

class AnasayfaView extends StatefulWidget {
  const AnasayfaView({super.key});

  @override
  State<AnasayfaView> createState() => _AnasayfaViewState();
}

class _AnasayfaViewState extends State<AnasayfaView> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(hintText: "ara"),
                onChanged: (value) {
                  context.read<AnasayfaCubit>().kisiAra(value);
                },
              )
            : const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                    context.read<AnasayfaCubit>().kisileriYukle();
                  },
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Kisiler>>(
        builder: (context, kisilerListesi) {
          if (kisilerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: kisilerListesi.length,
              itemBuilder: (context, index) {
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KisiDetayView(kisi: kisi),
                        )).then((value) {
                      context.read<AnasayfaCubit>().kisileriYukle();
                      print("anasayfaya dönüldü");
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(" ${kisi.kisi_ad} - ${kisi.kisi_tel} "),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "${kisi.kisi_ad} - ${kisi.kisi_id} silinsin mi ?"),
                                  action: SnackBarAction(
                                      label: "Evet",
                                      onPressed: () {
                                        context
                                            .read<AnasayfaCubit>()
                                            .sil(int.parse(kisi.kisi_id));
                                      }),
                                ));
                              },
                              icon: const Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.black54,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
            builder: (context) => const KisiKayitView(),
          ))
              .then((value) {
            context.read<AnasayfaCubit>().kisileriYukle();
            print("anasayfaya dönüldü");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
