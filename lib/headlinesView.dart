import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/headlines_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HeadlinesView extends StatelessWidget {
  const HeadlinesView({super.key});
 String formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date); 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Headlines"),
        centerTitle: true,
      ),
      body: BlocBuilder<HeadlineBloc, HeadlineState>(
        builder: (context, state) {
          if (state is HeadlineLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HeadlineLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final article = state.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 175, 
                            height: 175, 
                            child: ClipRRect(
                              child: Image.network(
                                article.urlToImage,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.broken_image, color: Colors.red);
                                },
                              ),
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
                                Text( formatDate(article.publishedAt)  ),
                              ],
                            ),
                          ),
                        ],
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
