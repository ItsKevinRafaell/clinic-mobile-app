part of 'doctor_chat_bloc.dart';

@freezed
class DoctorChatEvent with _$DoctorChatEvent {
  const factory DoctorChatEvent.started() = _Started;
  const factory DoctorChatEvent.getDoctorChat() = _GetDoctorChat;
}
