import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sptripe_app/models/tarjeta_credito.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(const PagarState()) {
    on<PagarEvent>((event, emit) {});

    on<OnSeleccionarTartjeta>((event, emit) =>
        emit(state.copyWith(tarjetaActiva: true, tarjeta: event.tarjeta)));

    on<OnDesactivarTarjeta>(
        (event, emit) => emit(state.copyWith(tarjetaActiva: false)));
  }
}
