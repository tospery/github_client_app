import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late String login;
  @JsonKey(name: 'avatar_url') late String avatar;
  late String type;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? bio;
  @JsonKey(name: 'public_repos') late int publicRepos;
  late num followers;
  late num following;
  @JsonKey(name: 'created_at') late String createdAt;
  @JsonKey(name: 'updated_at') late String updatedAt;
  @JsonKey(name: 'total_private_repos') late int totalPrivateRepos;
  @JsonKey(name: 'owned_private_repos') late int ownedPrivateRepos;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
