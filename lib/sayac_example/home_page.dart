import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/sayac_example/sayac_cubit.dart';
import 'package:flutter_bloc_tutorial/sayac_example/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SayacCubit, int>(
            builder: (context, state) {
              return Text("$state");
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SecondPage()));
              },
              child: const Text("Geçiş Yap"))
        ],
      )),
    );
  }
}
