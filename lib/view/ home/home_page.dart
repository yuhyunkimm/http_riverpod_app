import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';
import 'package:http_riverpod_app/dto/post_respose_dto.dart';
import 'package:http_riverpod_app/repository/post_repository.dart';
import 'home_page_view_model.dart';

/*
* consumerwidget
* */
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pCon = ref.read(postController);
    HomePageModel? hpm = ref.watch(homePageViewModel);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: hpm != null
                  ? _buildListView(hpm.posts)
                  : CircularProgressIndicator()),
          ElevatedButton(
            onPressed: () {
              pCon.findPosts();
            },
            child: Text("페이지로드"),
          )
        ],
      ),
    );
  }

  ListView _buildListView(List<PostDto> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => ListTile(
        leading: Text("${posts[index].id}"),
        title: Text("${posts[index].title}"),
      ),
    );
  }
}
