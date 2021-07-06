import 'dart:async';
import 'package:frosh_link_api/api/apiCall.dart';
import 'package:flutter/material.dart';
import 'package:frosh_link_api/model/jobs.dart';
import 'package:frosh_link_api/widgets/searchwidgets.dart';
import 'detailsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _homepage createState() => _homepage();
}

class _homepage extends State<HomePage> {
  String query = '';
  List<Jobs> jobs = [];
  Timer? debouncer;
  @override
  void initState() {
    super.initState();
    init();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await JobApi.getJobs(query);

    setState(() => this.jobs = books);
  }

  Future searchJob(String query) async => debounce(() async {
        final books = await JobApi.getJobs(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.jobs = books;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API result')),
      body: Column(
        children: [
          SearchWidget(text: query, onChanged: searchJob, hintText: 'Search'),
          Expanded(
            child: ListView.builder(
                itemCount: this.jobs.length,
                itemBuilder: (context, index) {
                  return cards(this.jobs[index]);
                }),
          ),
        ],
      ),
    );
  }

  Widget cards(Jobs temp) {
    String title = temp.title;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailspage(jobDetails: temp)));
      },
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Text(
                '$title',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
