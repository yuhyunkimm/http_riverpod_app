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
}

// 창고 데이터 (homepage에 필요한 데이터)
class PostHomePageModel {
  // 필요한 list 타입
  List<Post> posts;
  PostHomePageModel({required this.posts});
}

