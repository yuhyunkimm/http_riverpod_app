


import 'package:http_riverpod_app/dto/post_respose_dto.dart';

class PostRepository {
// 화면 제어하면 안되고 통신과 파싱 역할만 해야한다
// 싱글톤
  static PostRepository _instance = PostRepository._single();
  PostRepository._single();
  factory PostRepository(){
    return _instance;
  }

  Future<List<PostDto>> findAll() {
    return Future.delayed(Duration(seconds: 1), () {
      return [
        PostDto(id: 1, title: "제목1"),
        PostDto(id: 2, title: "제목2"),
        PostDto(id: 3, title: "제목3"),
      ];
    });
  }

  Future<void>? save() {
    return null;
  }

}
