import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sptripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:sptripe_app/models/tarjeta_credito.dart';

import '../widgets/total_pay_button.dart';

class TarjetaPage extends StatelessWidget {
  const TarjetaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pagarBloc = BlocProvider.of<PagarBloc>(context);
    final TarjetaCredito tarjeta = pagarBloc.state.tarjeta!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              pagarBloc.add(OnDesactivarTarjeta());
              Navigator.pop(context);
            }),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
              isHolderNameVisible: true,
              cardNumber: tarjeta.cardNumberHidden,
              expiryDate: tarjeta.expiracyDate,
              cardHolderName: tarjeta.cardHolderName,
              cvvCode: tarjeta.cvv,
              showBackView: false,
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          ),
        ],
      ),
    );
  }
}
