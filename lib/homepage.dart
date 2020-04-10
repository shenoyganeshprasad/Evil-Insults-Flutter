import 'package:flutter/material.dart';
import 'package:evil_insult_app/widgets/button.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evil Insults'),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Center(child: Text('Insults Here')),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomButton(),
    );
  }
}