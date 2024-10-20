import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandingsMainView extends StatefulWidget {
  const StandingsMainView({super.key});

  @override
  State<StandingsMainView> createState() => _StandingsMainViewState();
}

class _StandingsMainViewState extends State<StandingsMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('standings'),),
    );
  }
}
