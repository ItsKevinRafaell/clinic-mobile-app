import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'xendit_callback_event.dart';
part 'xendit_callback_state.dart';
part 'xendit_callback_bloc.freezed.dart';

class XenditCallbackBloc extends Bloc<XenditCallbackEvent, XenditCallbackState> {
  XenditCallbackBloc() : super(_Initial()) {
    on<XenditCallbackEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
