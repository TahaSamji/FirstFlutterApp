import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/jobs.dart';
import 'package:http/http.dart' as http;

class MyJobsPage extends StatefulWidget {
  const MyJobsPage({super.key});

  @override
  State<MyJobsPage> createState() => _MyjobsPageState();
}

class _MyjobsPageState extends State<MyJobsPage> {
  Future<List<Jobs>> fetchAllPosts() async {
    final res = await http
        .get(Uri.parse('https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs'));
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(res.body.codeUnits));
      List<dynamic> data = jsonResponse['data'];

      List<Jobs> jobsList =
          data.map((item) => Jobs.fromJson(item['job'])).toList();
      return jobsList;
    } else {
      throw Exception();
    }
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else if (difference.inDays >= 1) {
      return difference.inDays == 1
          ? '1 day ago'
          : '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return difference.inHours == 1
          ? '1 hour ago'
          : '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes == 1
          ? '1 minute ago'
          : '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            "Jobs",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: const Color.fromARGB(255, 90, 1, 105),
              tooltip: 'Notification Icon',
              onPressed: () {},
            )
          ],
        ),
        body: Center(
          child: FutureBuilder(
              future: fetchAllPosts(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return ListView.builder(
                      itemCount: snap.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 7.0, horizontal: 6),
                            child: Card(
                              shadowColor: Colors.black,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              child: ListTile(
                                leading: SizedBox.square(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(
                                          snap.data![index].company.logo),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  snap.data![index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snap.data![index].company.name),
                                    Text(
                                        "${snap.data![index].location.nameEn}${' . '}${snap.data![index].workplace_type.nameEn}${' . '}${snap.data![index].type.nameEn}"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          timeAgo(snap.data![index].dateTime),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                      });
                } else if (snap.hasError) {
                  return const Text("no data");
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }
}
