

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/dto/post/post_respose_dto.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/model/post/post_repository.dart';

import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';




// Provider를 붙힌 것을 @를 붙혀서 IOC 컨테이너에 올린거랑 같다고 생각
// ref가 없으면 view를 제어하지 못한다
final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController{

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> postDtoList =  await PostRepository().findAll();
    ref.read(postHomePageProvider.notifier).init(postDtoList);

  }
}