import 'package:http_riverpod_app/view/%20home/dto/home_page_respose_dto.dart';

class PostRepository {

  static PostRepository _instance = PostRepository._single();

  PostRepository._single();

  factory PostRepository(){
    return _instance;
  }

  Future<List<HomePagePostDto>> findAll() {
    return Future.delayed(Duration(seconds: 1), () {
      return [
      HomePagePostDto(id: 1, title: "제목1"),
      HomePagePostDto(id: 2, title: "제목2"),
      HomePagePostDto(id: 3, title: "제목3"),
      ];
    });
  }

  Future<void>? save() {
    return null;
  }

}
