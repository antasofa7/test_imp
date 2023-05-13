import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_apps/cubit/faq_detail_cubit.dart';
import 'package:my_apps/cubit/list_faq_cubit.dart';
import 'package:my_apps/cubit/update_faq_cubit.dart';
import 'package:my_apps/widgets/button.dart';
import 'package:my_apps/widgets/input_field.dart';
import 'package:my_apps/widgets/loading_container.dart';

enum Mode { view, edit }

class DetailFaqDialog extends StatefulWidget {
  const DetailFaqDialog({super.key});

  @override
  State<DetailFaqDialog> createState() => _DetailFaqDialogState();
}

class _DetailFaqDialogState extends State<DetailFaqDialog> {
  Mode mode = Mode.view;

  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _pertanyaanController = TextEditingController();
  final TextEditingController _jawabanController = TextEditingController();
  bool statusPublish = true;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: FormBuilder(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        3,
                        (i) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    [
                                      'Pertanyaan',
                                      'Jawaban',
                                      'Status Publish'
                                    ][i],
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  mode == Mode.view
                                      ? BlocBuilder<FaqDetailCubit,
                                          FaqDetailState>(builder: (_, state) {
                                          if (state is FaqDetailSuccess) {
                                            var data = state.model.data;
                                            _pertanyaanController.text =
                                                data?.pertanyaan ?? '';
                                            _jawabanController.text =
                                                data?.jawaban ?? '';
                                            statusPublish =
                                                data?.statusPublish?.isEven ??
                                                        true
                                                    ? false
                                                    : true;
                                            id = data?.id!;

                                            return Text(
                                              [
                                                data?.pertanyaan ?? '',
                                                data?.jawaban ?? '',
                                                data?.statusPublish
                                                        .toString() ??
                                                    ''
                                              ][i],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            );
                                          } else if (state is FaqDetailFailed) {
                                            return Text(
                                              state.errorMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .error),
                                            );
                                          }
                                          return const LoadingContainer(
                                              width: 100.0,
                                              height: 16.0,
                                              margin: EdgeInsets.zero);
                                        })
                                      : i != 2
                                          ? InputField(
                                              label: '',
                                              maxLines: 3,
                                              controller: [
                                                _pertanyaanController,
                                                _jawabanController
                                              ][i])
                                          : FormBuilderSwitch(
                                              title: Text(
                                                'Status Publish',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              name: 'status_publish',
                                              initialValue: statusPublish,
                                              onChanged: (dynamic val) =>
                                                  setState(() {
                                                statusPublish = !statusPublish;
                                              }),
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none),
                                            ),
                                ],
                              ),
                            )),
                    SizedBox(
                      height: 60.0,
                      child: Row(
                        children: [
                          Expanded(
                              child: ButtonWidget(
                                  label: mode == Mode.view ? 'Tutup' : 'Batal',
                                  outlined: true,
                                  onPress: () {
                                    if (mode == Mode.view) {
                                      Navigator.pop(context);
                                    } else {
                                      setState(() {
                                        mode = Mode.view;
                                      });
                                    }
                                  })),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: mode == Mode.view
                                ? ButtonWidget(
                                    label: 'Edit',
                                    onPress: () {
                                      setState(() {
                                        mode = Mode.edit;
                                      });
                                    })
                                : BlocConsumer<UpdateFaqCubit, UpdateFaqState>(
                                    listener: (context, state) {
                                    if (state is UpdateFaqSuccess) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          state.model.message ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ));
                                      context.read<ListFaqCubit>().get();
                                    } else if (state is UpdateFaqFailed) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          state.errorMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        backgroundColor:
                                            Theme.of(context).colorScheme.error,
                                      ));
                                    }
                                  }, builder: (context, state) {
                                    if (state is UpdateFaqLoading) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    return ButtonWidget(
                                        label: 'Simpan',
                                        onPress: () {
                                          if (_formKey.currentState
                                                  ?.saveAndValidate() ??
                                              false) {
                                            if (true) {
                                              context
                                                  .read<UpdateFaqCubit>()
                                                  .update(
                                                      id: id!,
                                                      pertanyaan:
                                                          _pertanyaanController
                                                              .text,
                                                      jawaban:
                                                          _jawabanController
                                                              .text,
                                                      statusPublish:
                                                          statusPublish);
                                            }
                                          }
                                        });
                                  }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
