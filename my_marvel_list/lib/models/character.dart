class Character {
  final int id;
  final String name;
  final String? description;
  final String thumbnailUrl;

  Character({
    required this.id,
    required this.name,
    this.description,
    required this.thumbnailUrl,
  });

  factory Character.fromJson(final json) {
    final Map<String, dynamic> thumbnail = json['thumbnail'];
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnailUrl: '${thumbnail['path']}.${thumbnail['extension']}',
    );
  }
}
