import 'package:bloc/bloc.dart';
import 'package:bloc_session_2/models/post_model.dart';
import 'package:bloc_session_2/services/post_service.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetAllPosts>((event, emit) async {
      emit(PostLoading());
      List<PostModel>? posts = await PostService().getAllPost();
      if (posts == null) {
        emit(PostError(errorMessage: 'no internet connection'));
      } else {
        emit(PostSuccess(posts: posts));
      }
    });
  }
}
