import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sptripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:sptripe_app/pages/home_page.dart';
import 'package:sptripe_app/pages/pago_completo_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PagarBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stripe App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'pago_completo': (_) => const PagoCompletoPage(),
        },
        theme: ThemeData.light().copyWith(
            primaryColor: const Color(0xff284879),
            scaffoldBackgroundColor: const Color(0xff21232A)),
      ),
    );
  }
}
