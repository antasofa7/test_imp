import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_apps/cubit/auth_cubit.dart';
import 'package:my_apps/cubit/delete_faq_cubit.dart';
import 'package:my_apps/cubit/list_faq_cubit.dart';
import 'package:my_apps/models/list_faq_model.dart';
import 'package:my_apps/pages/login_page.dart';
import 'package:my_apps/widgets/create_faq_dialog.dart';
import 'package:my_apps/widgets/faq_list_widget.dart';
import 'package:my_apps/widgets/loading_container.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ListFaqCubit>().get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
          } else if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginPage.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: 'Hi, ',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: state.users.data?.name ?? '-',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18.0))
                    ])),
                TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    child: Text(
                      'Logout',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(decoration: TextDecoration.underline),
                    ))
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LoadingContainer(
                width: 180.0,
                height: 16.0,
                margin: EdgeInsets.all(0),
              ),
              LoadingContainer(
                width: 80.0,
                height: 14.0,
                margin: EdgeInsets.all(0),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              BlocConsumer<ListFaqCubit, ListFaqState>(
                  listener: (context, state) {
                if (state is ListFaqFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.errorMessage,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ));
                }
              }, builder: (context, state) {
                if (state is ListFaqSuccess) {
                  // List<Data> data = (state.models.data ?? [])
                  //     .where((e) => e.statusPublish!.toString().contains('1'))
                  //     .toList();
                  List<Data> data = (state.models.data ?? []);
                  int dataLength = data.length;
                  return BlocListener<DeleteFaqCubit, DeleteFaqState>(
                      listener: (context, state) {
                        if (state is DeleteFaqSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              state.message,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ));
                          context.read<ListFaqCubit>().get();
                        } else if (state is DeleteFaqFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              state.errorMessage,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ));
                        }
                      },
                      child: Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => context.read<ListFaqCubit>().get(),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (_, i) {
                              return Column(
                                children: [
                                  Dismissible(
                                    key: Key(data[i].id!.toString()),
                                    background: Container(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.delete,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        ),
                                      ),
                                    ),
                                    confirmDismiss: (direction) async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => AlertDialog(
                                          content: Text(
                                            'Yakin hapus ${data[i].pertanyaan}?',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                          ),
                                          actions: List.generate(
                                            2,
                                            (y) => TextButton(
                                                onPressed: [
                                                  () => Navigator.pop(
                                                      context, false),
                                                  () {
                                                    context
                                                        .read<DeleteFaqCubit>()
                                                        .delete(
                                                            id: data[i].id!);
                                                    Navigator.pop(
                                                        context, true);
                                                  }
                                                ][y],
                                                child: Text(
                                                  ['Batal', 'Hapus'][y],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                )),
                                          ),
                                        ),
                                      );
                                      return null;
                                    },
                                    child: FaqListWidget(
                                      id: data[i].id!,
                                      title: data[i].pertanyaan ?? '',
                                      content: data[i].jawaban ?? '',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  )
                                ],
                              );
                            },
                            itemCount: dataLength,
                          ),
                        ),
                      ));
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 100.0,
                    child: Expanded(
                      child: ListView(
                          children: List.generate(
                              10,
                              (index) => const LoadingContainer(
                                    width: double.infinity,
                                    height: 60.0,
                                    margin: EdgeInsets.only(bottom: 16.0),
                                  ))),
                    ),
                  ),
                );
              })
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const CreateFaqDialog(),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
