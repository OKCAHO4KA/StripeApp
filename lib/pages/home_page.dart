import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:sptripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:sptripe_app/data/tarjetas.dart';
import 'package:sptripe_app/helpers/helpers.dart';
import 'package:sptripe_app/pages/tarjeta_page.dart';
import 'package:sptripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagar'),
          actions: [
            IconButton(
                onPressed: () async {
                  // mostrarLoading(context);

                  // await Future.delayed(const Duration(seconds: 1));
                  // Navigator.pop(context);
                },
                icon: const Icon(Icons.add))
          ],
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

                    return GestureDetector(
                      onTap: () {
                        //context.bloc<PagarBloc>().add(OnSeleccionarTarjeta(tarjeta))
                        final pagarBloc = BlocProvider.of<PagarBloc>(context);
                        pagarBloc.add(OnSeleccionarTartjeta(tarjeta));

                        Navigator.push(
                            context, navegarFadeIn(context, TarjetaPage()));
                      },
                      child: Hero(
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
                    );
                  }),
            ),
            const Positioned(
              bottom: 0,
              child: TotalPayButton(),
            ),
          ],
        ));
  }
}
