import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/data/news_model.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
              ),
              child: ListTile(
                leading: Image.asset(news.image, width: 40, height: 40),
                title: Text(news.title),
                subtitle: Text(news.subtitle),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
