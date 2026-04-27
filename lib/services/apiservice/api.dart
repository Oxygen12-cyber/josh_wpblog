import 'package:wordpress_client/wordpress_client.dart';

String baseUrl = "https://josh-blog.wasmer.app/wp-json/wp/v2";

Uri baseurl = Uri.parse(baseUrl);
final client = WordpressClient(baseUrl: baseurl);

Future createPostWithClient(
  String title,
  String content,
  String excerpt,
) async {
  final request = CreatePostRequest(
    title: title,
    content: content,
    status: "publish",
    excerpt: excerpt,
    authorization: AppPasswordAuth(
      userName: "admin",
      password: "emCk VTT2 Z0JS 2Chn 1osC eaUH",
    ),
  );

  try {
    await client.posts.create(request);
  } catch (e) {
    return e.toString();
  }
}

Future<List<Post>> fetchPostWithClient(bool orderby) async {
  final request = ListPostRequest(
    order: orderby ? Order.desc : Order.asc,
    orderBy: OrderBy.date,
    queryParameters: {"_fields": "date,title,id,content,excerpt"},
    authorization: AppPasswordAuth(
      userName: 'admin',
      password: 'emCk VTT2 Z0JS 2Chn 1osC eaUH',
    ),
  );

  try {
    final response = await client.posts.list(request);
    return response.map(
      onSuccess: (response) {
        return response.data;
      },
      onFailure: (response) {
        return <Post>[];
      },
    );
  } catch (e) {
    return [];
  }
}

void main() {
  // getPosts();
  // createPost(
  //   "Emerging Ai trends",
  //   "new stuffs are being done by ai in this curent world",
  //   "josh",
  // );
  // createPostWithClient();
  fetchPostWithClient(true);
}
