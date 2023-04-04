import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';

/*
* consumerwidget
* */
class PostHomePage extends ConsumerWidget {
  const PostHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 아래와 같이 땡겨 온다
    PostController pc = ref.read(postController);
    // watch 하고 싶은 곳에서만
    PostHomePageModel? pm = ref.watch(postHomePageProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child:
                  pm != null ? _buildListView(pm.posts) : _buildListView([])),
          ElevatedButton(
            onPressed: () {
              // 컨트롤러가 레파지토리 요청
              pc.findPosts();
            },
            child: Text("페이지로드"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.addPost("제목4");
            },
            child: Text("한건추가"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.removePost(1);
            },
            child: Text("한건삭제"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.updatePost(Post(id: 2, title: "제목 ㅎㅎ"));
            },
            child: Text("한건수정"),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => ListTile(
        leading: Text("${posts[index].id}"),
        title: Text("${posts[index].title}"),
      ),
    );
  }
}
