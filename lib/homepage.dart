import 'package:evil_insult_app/model/network.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(snapshot.data.insult, style: kInsultStyle, textAlign: TextAlign.center,),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        startDelay: Duration(milliseconds: 1000),
        glowColor: Colors.purple,
        endRadius: 90.0,
        duration: Duration(milliseconds: 2000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              futureInsult = fetchData();
            });
          },
          child: Text(
            '😈',
            style: kEmojiStyle,
          ),
          backgroundColor: Colors.white,
        ),
        shape: BoxShape.circle,
        animate: true,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
