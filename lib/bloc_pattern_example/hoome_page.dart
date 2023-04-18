import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc_pattern_example/example_cubit.dart';

class HoomePage extends StatefulWidget {
  const HoomePage({super.key});

  @override
  State<HoomePage> createState() => _HoomePageState();
}

class _HoomePageState extends State<HoomePage> {
  var tfSayi1 = TextEditingController();
  var tfSayi2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 72),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<ExampleCubit, int>(
                  builder: (context, state) {
                    return Text("$state", style: const TextStyle(fontSize: 36));
                  },
                ),
                TextField(
                    controller: tfSayi1,
                    decoration: const InputDecoration(hintText: "sayi 1")),
                TextField(
                  controller: tfSayi2,
                  decoration: const InputDecoration(hintText: "sayi 2"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          String alinansayi1 = tfSayi1.text;
                          String alinansayi2 = tfSayi2.text;
                          context
                              .read<ExampleCubit>()
                              .toplamaYap(alinansayi1, alinansayi2);
                        },
                        child: const Text("toplama")),
                    ElevatedButton(
                        onPressed: () {
                          String alinansayi1 = tfSayi1.text;
                          String alinansayi2 = tfSayi2.text;
                          context
                              .read<ExampleCubit>()
                              .carpmaYap(alinansayi1, alinansayi2);
                        },
                        child: const Text("çarpma")),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
