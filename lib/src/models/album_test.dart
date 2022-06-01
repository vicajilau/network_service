class AlbumTest {
  final int userId;
  final int id;
  final String title;

  const AlbumTest({required this.userId, required this.id, required this.title});

  factory AlbumTest.fromJson(Map<String, dynamic> json) {
    return AlbumTest(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}