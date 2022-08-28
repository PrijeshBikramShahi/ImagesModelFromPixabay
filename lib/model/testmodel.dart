class TestPost {
  final String title;
  final int id;
  var thumbnailUrl;

  TestPost({required this.title, required this.id, required this.thumbnailUrl});
  static TestPost convertDataFromJson(Map json) {
    return TestPost(
        title: json['title'],
        id: json['id'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}
