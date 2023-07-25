part of 'pagar_bloc.dart';

@immutable
abstract class PagarEvent {}

class OnSeleccionarTartjeta extends PagarEvent {
  final TarjetaCredito tarjeta;

  OnSeleccionarTartjeta(this.tarjeta);
}

class OnDesactivarTarjeta extends PagarEvent {}
