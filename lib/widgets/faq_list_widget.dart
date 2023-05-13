import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_apps/cubit/faq_detail_cubit.dart';
import 'package:my_apps/widgets/detail_faq_dialog.dart';

class FaqListWidget extends StatefulWidget {
  final int id;
  final String title, content;

  const FaqListWidget(
      {super.key,
      required this.id,
      required this.title,
      required this.content});

  @override
  State<FaqListWidget> createState() => _FaqListWidgetState();
}

class _FaqListWidgetState extends State<FaqListWidget> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4.0,
          ),
          side: BorderSide(color: Theme.of(context).colorScheme.outline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // The title
        ListTile(
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: IconButton(
              icon: Icon(
                  _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onPressed: () {
                setState(() {
                  _showContent = !_showContent;
                });
              },
            ),
            onTap: () {
              context.read<FaqDetailCubit>().get(id: widget.id);

              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const DetailFaqDialog());
            }),
        // Show or hide the content based on the state
        _showContent
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(
                  widget.content,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              )
            : Container()
      ]),
    );
  }
}
