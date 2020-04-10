import 'package:evil_insult_app/model/network.dart';
import 'package:flutter/material.dart';
import 'package:evil_insult_app/widgets/button.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<Insult> futureInsult;

  @override
  void initState() {
    futureInsult = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evil Insults'),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<Insult>(
            future: futureInsult,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.insult);
              } else if(snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomButton(),
    );
  }
}
