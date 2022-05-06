// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubData _$GithubDataFromJson(Map<String, dynamic> json) => GithubData(
      login: json['login'] as String,
      avatarURL: json['avatar_url'] as String,
      contributions: json['contributions'] as num,
    );

Map<String, dynamic> _$GithubDataToJson(GithubData instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarURL,
      'contributions': instance.contributions,
    };
