import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_model.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final NewsModel news;
  const DetailScreen({super.key, required this.news});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.news.publishedAt!);
    String formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.news.title!,
                    child: SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Image.network(
                          widget.news.urlToImage!,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    left: 16,
                    top: 20,
                    child: IconButton(
                        color: Colors.white,
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.black,
                            elevation: 10),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.news.title!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formattedDate,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.news.description!,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                    Text(
                      widget.news.content!,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    launchUrl(Uri.parse(widget.news.url!),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Text(
                    "See the details of the news",
                    style: TextStyle(color: Colors.red.shade700),
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
