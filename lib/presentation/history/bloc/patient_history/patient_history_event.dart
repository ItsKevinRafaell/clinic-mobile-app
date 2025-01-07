part of 'patient_history_bloc.dart';

@freezed
class PatientHistoryEvent with _$PatientHistoryEvent {
  const factory PatientHistoryEvent.started() = _Started;
  const factory PatientHistoryEvent.getOrdersPatient() = _GetOrdersPatient;
}
