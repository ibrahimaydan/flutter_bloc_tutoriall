import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc_pattern_example/example_cubit.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/cubit/anasayfa_cubit.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/cubit/kisi_detay_cubit.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/cubit/kisi_kayit_cubit.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/views/anasayfa_view.dart';
import 'package:flutter_bloc_tutorial/sayac_example/sayac_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExampleCubit()),
        BlocProvider(create: (context) => SayacCubit()),
        BlocProvider(create: (context) => KisikayitCubit()),
        BlocProvider(create: (context) => KisiDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const AnasayfaView(),
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      ),
    );
  }
}
