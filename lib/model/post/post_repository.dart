import 'package:http_riverpod_app/dto/post/post_respose_dto.dart';
import 'package:http_riverpod_app/model/post/post.dart';

class PostRepository {
// 화면 제어하면 안되고 통신과 파싱 역할만 해야한다
// 싱글톤
  static PostRepository _instance = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 1), () {
      return [
        Post(id: 1, title: "제목1"),
        Post(id: 2, title: "제목2"),
        Post(id: 3, title: "제목3"),
      ];
    });
  }

  Future<Post> save(String title) {
    return Future.delayed(Duration(seconds: 1), () {
      return Post(id: 4, title: "제목2");
    });
  }

  // response dTO
  Future<void> deleteById(int id) {
     return Future.delayed(Duration(seconds: 1));
  }

  Future<Post> update(Post post) {
    return Future.delayed(Duration(seconds: 1), () {
      return post;
    });
  }
}
