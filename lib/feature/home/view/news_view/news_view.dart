import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/data/mock/news_mock.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Haberler",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
              ),
              child: ListTile(
                leading: Image.asset(
                  news.image,
                  height: 45,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  news.title,
                  style: TextStyle(color: AppColors.black90),
                ),
                subtitle: Text(
                  news.subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black50,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.black60,
                ),
                onTap: () {
                  switch (news.category) {
                    case "ATP":
                      context.pushNamed(AppRoutes.newsAtp.name);
                    case "KORT DERGİSİ":
                      context.pushNamed(AppRoutes.newsTenis.name);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
