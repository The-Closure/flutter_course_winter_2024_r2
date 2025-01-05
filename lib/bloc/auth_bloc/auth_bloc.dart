import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:something/core/config/di.dart';
import 'package:something/model/user_model.dart';
import 'package:something/service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(Laoding());
      try {
        Map<String, dynamic> result =
            await AuthService().login(usermodel: event.userModel);
        sl.get<SharedPreferences>().setString(
              'token',
              result['accessToken'],
            );
        emit(
          AuthStatus(
            authStatus: true,
          ),
        );
      } catch (e) {
        emit(
          AuthStatus(
            authStatus: false,
          ),
        );
      }
    });
  }
}
