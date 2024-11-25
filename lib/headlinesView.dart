import 'package:flutter/material.dart';
import 'package:flutter_application_1/ShimmerEffectScreen.dart';
import 'package:flutter_application_1/bloc/headlines_bloc.dart';
import 'package:flutter_application_1/models/Artical.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';

class HeadlinesView extends StatelessWidget {
  const HeadlinesView({super.key});

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void openURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showModal(BuildContext context, Article article) async {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "By ${article.author}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Published on ${formatDate(article.publishedAt)}",
                          ),
                          FloatingActionButton(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              onPressed: () {
                                openURL(article.url);
                              },
                              child: const Text("View"))
                        ]),
                    const SizedBox(height: 16),
                    if (article.urlToImage != "No Image")
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          article.urlToImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container();
                          },
                        ),
                      ),
                    const SizedBox(height: 16),
                    Text(
                      article.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      article.content,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Headline News",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("Read Top News Today ",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.normal)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/newspaper.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 254, 254),
        shadowColor: Colors.black,
      ),
      body: BlocBuilder<HeadlineBloc, HeadlineState>(
        builder: (context, state) {
          if (state is HeadlineLoading) {
            return const ShimmerList();
          } else if (state is HeadlineLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final article = state.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => {
                      _showModal(context, article),
                    },
                    child: Card(
                      shadowColor: Colors.orange,
                      color: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            article.urlToImage.isEmpty ||
                                    article.urlToImage == "No Image"
                                ? SizedBox(
                                    width: 175,
                                    height: 175,
                                    child: Image.asset(
                                      'assets/noimage.png',
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : SizedBox(
                                    width: 175,
                                    height: 175,
                                    child: Image.network(
                                      article.urlToImage.trim(),
                                      fit: BoxFit.cover,
                                      frameBuilder: (BuildContext context,
                                          Widget child,
                                          int? frame,
                                          bool wasSynchronouslyLoaded) {
                                        if (wasSynchronouslyLoaded) {
                                          return child;
                                        }
                                        return Shimmer.fromColors(
                                          baseColor: Colors.black12,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            width: 175,
                                            height: 175,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/noimage.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    article.author,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(formatDate(article.publishedAt)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is HeadlineError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }
          return const Center(child: Text("No data available"));
        },
      ),
    );
  }
}
