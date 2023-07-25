import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sptripe_app/bloc/pagar/pagar_bloc.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: width,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                '250,55 €',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          BlocBuilder<PagarBloc, PagarState>(
              builder: (BuildContext context, state) {
            return _BtnPay(state);
          }),
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  const _BtnPay(this.state);
  final PagarState state;
  @override
  Widget build(BuildContext context) {
    return !state.tarjetaActiva!
        ? buildBotonTarjeta(context)
        : buildAppleAndAndroidPay(context);
  }

  Widget buildBotonTarjeta(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 170,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      onPressed: () {},
      child: const Row(
        children: [
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
          Text('    Pay', style: TextStyle(fontSize: 22, color: Colors.white)),
        ],
      ),
    );
  }

  Widget buildAppleAndAndroidPay(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      onPressed: () {},
      child: Row(
        children: [
          Icon(
              Platform.isAndroid
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.white),
          const Text('   Pay',
              style: TextStyle(fontSize: 22, color: Colors.white)),
        ],
      ),
    );
  }
}
