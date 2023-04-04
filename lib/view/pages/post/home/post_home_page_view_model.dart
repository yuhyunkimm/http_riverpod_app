import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/dto/post/post_respose_dto.dart';
import 'package:http_riverpod_app/model/post/post.dart';

// homepage내 사용하는 것은 의미 있는 이름으로 사용
// homepagepostdto -> 통신 데이터

// 창고 관리자 (provider)
final postHomePageProvider =
    StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  // HomePageViewModel 창고에 들고 있다
  return PostHomePageViewModel(null);
});

// 창고 (store)
// homepage의 store / page의 provider
// 그냥 provider는 값이 변경 되지 않음
// 통신요청은 controller에서 해준다
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?> {
  PostHomePageViewModel(super.state);

  void init(List<Post> postDtoList){
    state = PostHomePageModel(posts: postDtoList);
  }


  // 추가
  // 변경감지는 레퍼런스 주소가 감지한다
  void add(Post post) {
    List<Post> posts = state!.posts;
    //posts.add(post);
    // 정리 연산자 사용 => 깊은 복사가 된다
    // 깊은 복사할때 => 추가 삭제 수정 검색
    List<Post> newPosts = [...posts, post];
    // 조건 : 레퍼런스주소가 같으면 변경이 안된다
    // new 해준 새로운 레퍼런스는 변경 감지
    state = PostHomePageModel(posts: newPosts); //레퍼런스가 달라지면 된다(값이 동일해도 다시 그린다)
  }
  // 삭제
  void remove(int id){
    List<Post> posts = state!.posts;
    // where 깊은 복사
    // id가 같을때 return을 false
    // e.id == id id 검색
    // where은 검색과 삭제 역할을 한다
    List<Post> newPosts = posts.where((e) => e.id != id).toList();
    state = PostHomePageModel(posts: newPosts);
  }

  // 수정(배열)
  void update(Post post){
    List<Post> posts = state!.posts;
    // e.id와 post.id가 같으면 post를 리턴하고 아니면 e를 리턴해 준다
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList();
    state = PostHomePageModel(posts: newPosts);
  }
}

// 창고 데이터 (homepage에 필요한 데이터)
class PostHomePageModel {
  // 필요한 list 타입
  List<Post> posts;
  PostHomePageModel({required this.posts});
}

