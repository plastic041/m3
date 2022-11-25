class Post {
  final String id;
  final String username;
  final String acct;
  final String displayName;
  final String content;
  final DateTime createdAt;
  final String avatar;

  const Post({
    required this.id,
    required this.username,
    required this.acct,
    required this.displayName,
    required this.content,
    required this.createdAt,
    required this.avatar,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      username: json['account']['username'],
      acct: json['account']['acct'],
      displayName: json['account']['display_name'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      avatar: json['account']['avatar'],
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Post && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  Post copyWith({
    String? id,
    String? username,
    String? acct,
    String? displayName,
    String? content,
    DateTime? createdAt,
    String? avatar,
  }) {
    return Post(
      id: id ?? this.id,
      username: username ?? this.username,
      acct: acct ?? this.acct,
      displayName: displayName ?? this.displayName,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      avatar: avatar ?? this.avatar,
    );
  }
}
