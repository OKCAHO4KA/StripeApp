import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:sptripe_app/data/tarjetas.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagar'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 160,
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: PageController(viewportFraction: 0.9),
                  itemCount: tarjetas.length,
                  itemBuilder: (_, i) {
                    final tarjeta = tarjetas[i];

                    return CreditCardWidget(
                      cardNumber: tarjeta.cardNumberHidden,
                      expiryDate: tarjeta.expiracyDate,
                      cardHolderName: tarjeta.cardHolderName,
                      cvvCode: tarjeta.cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (CreditCardBrand) {},
                    );
                  }),
            )
          ],
        ));
  }
}
