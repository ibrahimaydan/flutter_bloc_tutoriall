import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/sayac_example/sayac_cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ikinci sayfa"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<SayacCubit, int>(
            builder: (context, state) {
              return Text("$state");
            },
          ),
          TextButton(
              onPressed: () {
                context.read<SayacCubit>().sayaciArttir();
              },
              child: const Text("Arttır")),
          TextButton(
              onPressed: () {
                context.read<SayacCubit>().sayaciAzalt();
              },
              child: const Text("Azalt")),
        ]),
      ),
    );
  }
}
