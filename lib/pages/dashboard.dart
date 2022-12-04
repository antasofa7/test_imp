import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_apps/cubit/articles_cubit.dart';
import 'package:my_apps/cubit/auth_cubit.dart';
import 'package:my_apps/models/articles_model.dart';
import 'package:my_apps/pages/login_page.dart';
import 'package:my_apps/theme.dart';
import 'package:my_apps/widgets/horizontal_article_tile.dart';
import 'package:my_apps/widgets/loading_container.dart';
import 'package:my_apps/widgets/vertical_article_tile.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/dashboard';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    context.read<ArticlesCubit>().fetchArticles();
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
                    text: 'Welcome, ',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: state.users.user.name,
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
          return const LoadingContainer(
            width: 180.0,
            height: 16.0,
            margin: EdgeInsets.all(0),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<ArticlesCubit, ArticlesState>(
          listener: (context, state) {
        if (state is ArticlesFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            state.errorMessage,
            style: Theme.of(context).textTheme.bodyLarge,
          )));
        }
      }, builder: (context, state) {
        if (state is ArticlesSuccess) {
          List<Article> articles = state.articles.articles;
          int dataLength = articles.length;
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                Container(
                  height: 248.0,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HorizontalArticleTile(
                          articles: articles, index: index);
                    },
                    itemCount: dataLength,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return VerticalArticleTile(
                          articles: articles, index: index);
                    },
                    itemCount: dataLength,
                  ),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoadingContainer(
                width: 180.0,
                height: 16.0,
                margin: EdgeInsets.all(0),
              ),
              Container(
                height: 248.0,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        LoadingContainer(
                          width: 150.0,
                          height: 16.0,
                          margin: EdgeInsets.only(bottom: 8.0),
                        ),
                        LoadingContainer(
                          width: 200.0,
                          height: 200.0 - 28.0,
                          margin: EdgeInsets.only(right: 16.0),
                        ),
                      ],
                    );
                  },
                  itemCount: 3,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        const LoadingContainer(
                          width: double.infinity,
                          height: 200.0,
                          margin: EdgeInsets.only(bottom: 16.0),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      margin: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        color: neutral500,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          156.0,
                                      height: 40.0,
                                      margin: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        color: neutral500,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 48.0,
                                  height: 50.0,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: neutral500,
                                  ),
                                ),
                                Container(
                                  width: 180.0,
                                  height: 16.0,
                                  margin: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: neutral500,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
