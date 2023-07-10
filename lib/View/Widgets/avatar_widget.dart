import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60.0,
      backgroundImage: AssetImage('lib/Images/user_photo.jpg'),
    );
  }
}
