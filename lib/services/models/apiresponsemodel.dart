class ApiResponse {
  final String title;
  final String content;
  final String excerpt;
  final String date;
  final String id;
  final String status;
  final String type;
  final String link;
  final String featuredImageUrl;
  final String authorMeta;
  final String self;

  ApiResponse({
    required this.title,
    required this.content,
    required this.excerpt,
    required this.date,
    required this.id,
    required this.status,
    required this.type,
    required this.link,
    required this.featuredImageUrl,
    required this.authorMeta,
    required this.self,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      title: json['title'],
      content: json['content'],
      excerpt: json['excerpt'],
      date: json['date'],
      id: json['id'],
      status: json['status'],
      type: json['type'],
      link: json['link'],
      featuredImageUrl: json['featuredImageUrl'],
      authorMeta: json['authorMeta'],
      self: json['self'],
    );
  }
}
