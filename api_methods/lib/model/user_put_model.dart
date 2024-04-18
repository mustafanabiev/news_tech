class UserPutModel {
  const UserPutModel({
    required this.name,
    required this.job,
    this.updatedAt,
  });

  final String name;
  final String job;
  final String? updatedAt;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'job': job,
    };
  }

  factory UserPutModel.fromJson(Map<String, dynamic> map) {
    return UserPutModel(
      name: map['name'] as String,
      job: map['job'] as String,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }
}
