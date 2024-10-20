import 'package:flutter/material.dart';

class WatchView extends StatefulWidget {
  const WatchView({super.key});

  @override
  State<WatchView> createState() => _WatchViewState();
}

class _WatchViewState extends State<WatchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Watch'),
      ),
    );
  }
}
