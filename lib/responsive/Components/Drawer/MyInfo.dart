import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2b005c).withOpacity(0.4),
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.avatarUrl!),
          ),
          Spacer(),
          Text(
            "Apollo Daniel",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Flutter developer",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
