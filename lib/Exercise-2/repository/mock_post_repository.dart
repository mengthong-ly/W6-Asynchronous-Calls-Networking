import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPost() {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        Post(
          id: 25,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
        Post(
          id: 25,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
        Post(
          id: 25,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
        Post(
          id: 25,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
      ];
      // if (postId != 25) {
      //   throw Exception("No post found");
      // }
      // return Post(
      //   id: 25,
      //   title: 'Who is the best',
      //   description: 'teacher ronan',
      // );
    });
  }
}
