part of 'patient_history_bloc.dart';

@freezed
class PatientHistoryState with _$PatientHistoryState {
  const factory PatientHistoryState.initial() = _Initial;
  const factory PatientHistoryState.loading() = _Loading;
  const factory PatientHistoryState.success(OrderResponseModel data) = _Success;
  const factory PatientHistoryState.error(String message) = _Error;
}
