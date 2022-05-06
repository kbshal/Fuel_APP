import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_prices/model/Github/github_model.dart';
import 'package:fuel_prices/services/github_contrib.dart';

class ContributorPage extends StatefulWidget {
  const ContributorPage({Key? key}) : super(key: key);

  @override
  State<ContributorPage> createState() => _ContributorPageState();
}

class _ContributorPageState extends State<ContributorPage> {
  var data;
  String error = "";
  GithubContrib githubContrib = GithubContrib();
  List<GithubData>? list = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    try {
      data = await githubContrib.getGithubContributor();
      if (data is Exception) {
        throw Exception("Retry!!");
      } else {
        list = data;
      }
    } catch (e) {
      setState(() {
        error = "Retry!";
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(CupertinoIcons.back)),
          title: Text(
            "Contributor",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: (list!.isEmpty)?CircularProgressIndicator():GridView.builder(
          itemCount: list!.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              var data = list![index].avatarURL;
              return Container(
                child: Image.network(data),
              );  
            }),
            );
  }
}
