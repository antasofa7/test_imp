import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_apps/cubit/create_faq_cubit.dart';
import 'package:my_apps/cubit/list_faq_cubit.dart';
import 'package:my_apps/widgets/button.dart';
import 'package:my_apps/widgets/input_field.dart';

class CreateFaqDialog extends StatefulWidget {
  const CreateFaqDialog({super.key});

  @override
  State<CreateFaqDialog> createState() => _CreateFaqDialogState();
}

class _CreateFaqDialogState extends State<CreateFaqDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _pertanyaanController = TextEditingController();
  final TextEditingController _jawabanController = TextEditingController();
  bool statusPublish = true;

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
                children: [
                  InputField(
                      label: 'Pertanyaan',
                      maxLines: 3,
                      controller: _pertanyaanController),
                  const SizedBox(
                    height: 8.0,
                  ),
                  InputField(
                      label: 'Jawaban',
                      maxLines: 3,
                      controller: _jawabanController),
                  FormBuilderSwitch(
                    title: Text(
                      'Status Publish',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    name: 'status_publish',
                    initialValue: true,
                    onChanged: (dynamic val) => setState(() {
                      statusPublish = !statusPublish;
                    }),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          label: 'Batal',
                          onPress: () => Navigator.pop(context),
                          outlined: true,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: BlocConsumer<CreateFaqCubit, CreateFaqState>(
                            listener: (context, state) {
                          if (state is CreateFaqSuccess) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                state.model.message ?? '',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ));
                            context.read<ListFaqCubit>().get();
                          } else if (state is CreateFaqFailed) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                state.errorMessage,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            ));
                          }
                        }, builder: (context, state) {
                          if (state is CreateFaqLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ButtonWidget(
                              label: 'Simpan',
                              onPress: () {
                                if (_formKey.currentState?.saveAndValidate() ??
                                    false) {
                                  if (true) {
                                    context.read<CreateFaqCubit>().create(
                                        pertanyaan: _pertanyaanController.text,
                                        jawaban: _jawabanController.text,
                                        statusPublish: statusPublish);
                                  }
                                }
                              });
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
