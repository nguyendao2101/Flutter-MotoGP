import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsMainView extends StatefulWidget {
  const ResultsMainView({super.key});

  @override
  State<ResultsMainView> createState() => _ResultsMainViewState();
}

class _ResultsMainViewState extends State<ResultsMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('results'),),
    );
  }
}
