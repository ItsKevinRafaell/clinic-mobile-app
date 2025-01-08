import 'package:bloc/bloc.dart';
import 'package:flutter_clinicmobile_app_kevin/data/datasources/doctor_remote_datasource.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/response/doctor_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_chat_event.dart';
part 'doctor_chat_state.dart';
part 'doctor_chat_bloc.freezed.dart';

class DoctorChatBloc extends Bloc<DoctorChatEvent, DoctorChatState> {
  final DoctorRemoteDatasource doctorRemoteDatasource;
  DoctorChatBloc(this.doctorRemoteDatasource) : super(const _Initial()) {
    on<_GetDoctorChat>((event, emit) async {
      emit(const _Loading());
      final result = await doctorRemoteDatasource.getDoctorChat();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
