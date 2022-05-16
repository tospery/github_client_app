import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo();

  late num id;
  late String name;
  @JsonKey(name: 'full_name') late String fullName;
  late User owner;
  Repo? parent;
  late bool private;
  late String description;
  late bool fork;
  String? language;
  @JsonKey(name: 'forks_count') late int forksCount;
  @JsonKey(name: 'stargazers_count') late int stargazersCount;
  late num size;
  @JsonKey(name: 'default_branch') late String defaultBranch;
  @JsonKey(name: 'open_issues_count') late int openIssuesCount;
  @JsonKey(name: 'pushed_at') late String pushedAt;
  @JsonKey(name: 'created_at') late String createdAt;
  @JsonKey(name: 'updated_at') late String updatedAt;
  @JsonKey(name: 'subscribers_count') int? subscribersCount;
  Map<String,dynamic>? license;
  
  factory Repo.fromJson(Map<String,dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
