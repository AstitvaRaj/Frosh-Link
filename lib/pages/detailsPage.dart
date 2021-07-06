import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:frosh_link_api/model/jobs.dart';

class detailspage extends StatefulWidget {
  final Jobs jobDetails;
  const detailspage({Key? key, required this.jobDetails}) : super(key: key);

  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailspage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final jobdetails = widget.jobDetails;
    return Scaffold(
      appBar: AppBar(
        title: Text('${jobdetails.title}'),
      ),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * 0.95,
              child: Column(
                children: [
                  Html(data: jobdetails.description),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
