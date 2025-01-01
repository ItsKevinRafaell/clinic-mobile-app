import 'package:bloc/bloc.dart';
import 'package:flutter_clinicmobile_app_kevin/data/datasources/auth_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_google_event.dart';
part 'login_google_state.dart';
part 'login_google_bloc.freezed.dart';

class LoginGoogleBloc extends Bloc<LoginGoogleEvent, LoginGoogleState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  LoginGoogleBloc(this._authRemoteDatasource) : super(_Initial()) {
    on<_LoginGoogle>((event, emit) async {
      emit(const _Loading());
      final result = await _authRemoteDatasource.loginGoogle(event.idToken);
      if (result != null) {
        emit(_Success(result));
      } else {
        emit(const _Error('Failed to login'));
      }
    });
  }
}
