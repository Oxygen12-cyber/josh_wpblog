import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wordpress_client/wordpress_client.dart';

String baseUrl = "http://127.0.0.1:8080/wp-json/wp/v2";

Uri baseurl = Uri.parse(baseUrl);
final client = WordpressClient(baseUrl: baseurl);

Uri url = Uri.parse("$baseUrl/posts?_fields=date,title,id,content,excerpt");
Uri postUrl = Uri.parse("$baseUrl/posts");

Future<List<dynamic>> getPosts() async {
  try {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    }
  } catch (e) {
    print(e);
  }
  return [];
}

Future createPost(String title, String content, String excerpt) async {
  try {
    http.Response response = await http.post(
      postUrl,
      headers: {"Content-Type": "application/json"},
      body: {
        "title": title,
        "content": content,
        "date": DateTime.now().toIso8601String(),
        "excerpt": excerpt,
      },
    );
    if (response.statusCode == 201) {
      print("successfully senr request");
      print(response.body);
    } else {
      print("$response.statusCode $jsonDecode(response.body)");
    }
  } catch (e) {
    print(e);
  }
}

Future createPostWithClient(String title, String content, String excerpt) async {
  final request = CreatePostRequest(
    title: title,
    content: content,
    status: "publish",
    excerpt: excerpt,
    authorization: AppPasswordAuth(
      userName: "joshua",
      password: "XjSk srzR T0bk EAdb 3UXo AkBV",
    ),
  );

  try {
    final response = await client.posts.create(request);
    print('successfully posted');
    print(response);
  } catch (e) {
    print(e);
  }
}

Future<List<Post>> fetchPostWithClient(bool orderby) async {
  final request = ListPostRequest(
    order: orderby ? Order.desc : Order.asc,
    orderBy: OrderBy.date,
    queryParameters: {"_fields": "date,title,id,content,excerpt"},
    authorization: AppPasswordAuth(
      userName: 'joshua',
      password: 'XjSk srzR T0bk EAdb 3UXo AkBV',
    ),
  );

  try {
    final response = await client.posts.list(request);
    print('successfully fetched');
    return response.map(
      onSuccess: (response) {
        print(response.data);
        return response.data;
      },
      onFailure: (response) {
        print(response.error.toString());
        return <Post>[];
      },
    );
  } catch (e) {
    print(e);
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
