import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_prices/model/Github/github_model.dart';
import 'package:fuel_prices/services/github_contrib.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    Size size = MediaQuery.of(context).size;
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
        body: (error.isNotEmpty)
            ? Center(
                child: Text(error),
              )
            : loadProfile(list!, context, size));
  }
}

Widget loadProfile(List<GithubData> list, BuildContext context, Size size) {
  if (list.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  } else {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var data = list[index];
          return InkWell(
            onTap: () async {
              if (await canLaunchUrlString(data.url)) {
                await launchUrlString(data.url,
                    mode: LaunchMode.externalApplication);
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.08),
              height: size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.teal,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(size.width * 0.92 * 0.15),
                        child: Image.network(
                          data.avatarURL,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.92 * 0.13),
                    child: Container(
                      height: size.height * 0.2 * 0.9,
                      width: size.width * 0.92 * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.login,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/github.png",
                            height: size.height * 0.2 * 0.9 * 0.4,
                            width: size.width * 0.92 * 0.4 * 0.3,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
