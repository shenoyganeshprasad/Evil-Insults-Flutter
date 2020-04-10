import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';


class BottomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: Duration(milliseconds: 1000),
      glowColor: Colors.purple,
      endRadius: 90.0,
      duration: Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: FloatingActionButton(
        onPressed: () {},
        child: Text('😈', style: TextStyle(fontSize: 22.0),),
        backgroundColor: Colors.white,
      ),
      shape: BoxShape.circle,
      animate: true,
      curve: Curves.fastOutSlowIn,
    );
  }
}
