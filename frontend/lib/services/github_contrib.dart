import 'dart:convert';

import 'package:fuel_prices/model/Github/github_model.dart';

import 'package:http/http.dart' as http;

class GithubContrib {
  Future getGithubContributor() async {
    try {
      var url = Uri.parse(
          "https://api.github.com/repos/PrabeshPP/Fuel-App/contributors");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final list = jsonDecode(response.body);
        List<GithubData> githubListData =
            List.from(list).map((data) => GithubData.fromJson(data)).toList();
        return githubListData;
      } else {
        throw Exception("Could not fetch the data");
      }
    } catch (e) {
      return e;
    }
  }
}
