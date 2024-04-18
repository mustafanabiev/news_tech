class UserPostModel {
  const UserPostModel({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
  });
  final String name;
  final String job;
  final String? id;
  final String? createdAt;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'job': job,
    };
  }

  factory UserPostModel.fromJson(Map<String, dynamic> map) {
    return UserPostModel(
      name: map['name'] as String,
      job: map['job'] as String,
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
    );
  }
}
