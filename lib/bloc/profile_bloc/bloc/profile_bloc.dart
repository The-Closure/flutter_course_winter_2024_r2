import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:something/bloc/auth_bloc/auth_bloc.dart';
import 'package:something/model/profile_model.dart';
import 'package:something/service/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        ProfileModel profileModel = await ProfileService().getProfile();
        emit(
          ProfileSuccess(
            profileModel: profileModel,
          ),
        );
      } catch (e) {
        emit(ProfileError(
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
