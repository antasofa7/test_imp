import 'package:flutter/material.dart';
import 'package:my_apps/models/articles_model.dart';
import 'package:my_apps/utils/date_time_format.dart';

class VerticalArticleTile extends StatelessWidget {
  final List<Article> articles;
  final int index;
  const VerticalArticleTile(
      {super.key, required this.articles, required this.index});

  @override
  Widget build(BuildContext context) {
    int dataLength = articles.length;
    return Container(
      width: double.infinity,
      height: 200.0,
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: index == dataLength - 1 ? 0 : 16.0),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(6.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(
                  articles[index].image,
                  width: 100.0,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Expanded(
                child: Text(
                  articles[index].title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            articles[index].content,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            DateTimeFormat.format(articles[index].created.date),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
