import 'package:bloc/bloc.dart';
import 'package:flutter_clinicmobile_app_kevin/data/datasources/order_remote_datasource.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/response/order_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_history_event.dart';
part 'patient_history_state.dart';
part 'patient_history_bloc.freezed.dart';

class PatientHistoryBloc
    extends Bloc<PatientHistoryEvent, PatientHistoryState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  PatientHistoryBloc(this.orderRemoteDatasource) : super(_Initial()) {
    on<PatientHistoryEvent>((event, emit) async {
      emit(const _Loading());
      final result = await orderRemoteDatasource.getOrderByPatient();
      // result.fold((l) => emit(_Error(l)), (r) => (_Success(r)));
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
