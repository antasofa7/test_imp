import 'package:flutter/material.dart';
import 'package:my_apps/models/articles_model.dart';

class HorizontalArticleTile extends StatelessWidget {
  final List<Article> articles;
  final int index;
  const HorizontalArticleTile(
      {super.key, required this.articles, required this.index});

  @override
  Widget build(BuildContext context) {
    int dataLength = articles.length;
    return Container(
        width: 200.0,
        margin: EdgeInsets.only(right: index == dataLength - 1 ? 0 : 16.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              articles[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              articles[index].content,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 7,
            ),
          ],
        ));
  }
}
