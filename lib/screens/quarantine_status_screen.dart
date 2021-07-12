import 'package:flutter/material.dart';

class QuarantineStatusScreen extends StatelessWidget {
  static const routeName = 'quarantine-status-screen';
  const QuarantineStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quarantine Status Screen'),
      ),
      body: Center(),
    );
  }
}
