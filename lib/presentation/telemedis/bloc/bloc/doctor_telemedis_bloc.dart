import 'package:bloc/bloc.dart';
import 'package:flutter_clinicmobile_app_kevin/data/datasources/doctor_remote_datasource.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/doctor_response_mode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_telemedis_event.dart';
part 'doctor_telemedis_state.dart';
part 'doctor_telemedis_bloc.freezed.dart';

class DoctorTelemedisBloc
    extends Bloc<DoctorTelemedisEvent, DoctorTelemedisState> {
  final DoctorRemoteDatasource doctorRemoteDatasource;

  DoctorTelemedisBloc(this.doctorRemoteDatasource) : super(_Initial()) {
    on<_GetDoctorTelemedis>((event, emit) async {
      emit(const _Loading());
      final result = await doctorRemoteDatasource.getDoctorTelemedis();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
