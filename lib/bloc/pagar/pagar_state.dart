part of 'pagar_bloc.dart';

@immutable
class PagarState {
  final double? montoPagar;
  final String? moneda; //CAD, USD; EUR
  final bool? tarjetaActiva;
  final TarjetaCredito? tarjeta;

  const PagarState(
      {this.montoPagar = 375.99,
      this.moneda = 'EUR',
      this.tarjetaActiva = false,
      this.tarjeta});

  PagarState copyWith(
          {final double? montoPagar,
          final String? moneda, //CAD, USD; EUR
          final bool? tarjetaActiva,
          final TarjetaCredito? tarjeta}) =>
      PagarState(
          montoPagar: montoPagar ?? this.montoPagar,
          moneda: moneda ?? this.moneda, //CAD, USD; EUR
          tarjetaActiva: tarjetaActiva ?? this.tarjetaActiva,
          tarjeta: tarjeta ?? this.tarjeta);
}
