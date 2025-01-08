part of 'doctor_chat_bloc.dart';

@freezed
class DoctorChatState with _$DoctorChatState {
  const factory DoctorChatState.initial() = _Initial;
  const factory DoctorChatState.loading() = _Loading;
  const factory DoctorChatState.loadeds(List<DoctorModel> doctors) = _Loaded;
  const factory DoctorChatState.error(String message) = _Error;
}
