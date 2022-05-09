import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'github_model.g.dart';

@JsonSerializable()
class GithubData extends Equatable {
  @JsonKey(name: "login")
  final String login;
  @JsonKey(name: "avatar_url")
  final String avatarURL;
  @JsonKey(name: "contributions")
  final num contributions;
  @JsonKey(name: "html_url")
  final String url;

  const GithubData(
      {required this.login,
      required this.avatarURL,
      required this.contributions,
      required this.url});

  factory GithubData.fromJson(Map<String, dynamic> json) =>
      _$GithubDataFromJson(json);

  Map<String, dynamic> toJson() => _$GithubDataToJson(this);

  @override
  List<Object?> get props => [login, avatarURL, contributions];
}
