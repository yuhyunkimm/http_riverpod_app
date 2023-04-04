

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/repository/post_repository.dart';
import 'package:http_riverpod_app/view/%20home/dto/home_page_respose_dto.dart';
import 'package:http_riverpod_app/view/%20home/home_page_view_model.dart';

final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController{

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<HomePagePostDto> homePagePostDtos =  await PostRepository().findAll();
    ref.read(homePageViewModel.notifier).state = HomePageModel(posts: homePagePostDtos);

  }
}