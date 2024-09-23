class Series {
  final int id;
  final String title;
  final String? description;
  final String thumbnailUrl;

  Series({
    required this.id,
    required this.title,
    this.description,
    required this.thumbnailUrl,
  });

  factory Series.fromJson(final json) {
    final Map<String, dynamic> thumbnail = json['thumbnail'];
    return Series(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl: '${thumbnail['path']}.${thumbnail['extension']}',
    );
  }
}
