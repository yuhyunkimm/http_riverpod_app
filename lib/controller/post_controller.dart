

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

  // delete 제외하고 다 돌려 줘야한다
  Future<void> addPost(String title)  async {
    Post post = await PostRepository().save(title);
    // postHomePageProvider.notifier = 창고 찾아 주세요
    // add 추가
    ref.read(postHomePageProvider.notifier).add(post);
  }

  void removePost(int id) async {
    PostRepository().deleteById(id);
    ref.read(postHomePageProvider.notifier).remove(id);

  }

  void updatePost(Post post) async {
    Post postPS = await PostRepository().update(post);
    ref.read(postHomePageProvider.notifier).update(postPS);
  }
}