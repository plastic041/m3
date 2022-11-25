class Post {
  final String id;
  final String username;
  final String acct;
  final String displayName;
  final String content;

  const Post({
    required this.id,
    required this.username,
    required this.acct,
    required this.displayName,
    required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      username: json['account']['username'],
      acct: json['account']['acct'],
      displayName: json['account']['display_name'],
      content: json['content'],
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Post && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
