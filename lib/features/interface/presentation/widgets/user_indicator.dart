import 'package:flutter/material.dart';

class UserIndicator extends StatelessWidget {
  final String name;
  final String url;
  final GestureTapCallback onTap;

  UserIndicator({this.name = "", this.url = "", this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          onTap();
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundImage: getAvatarImageProvider(url),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(name)
          ],
        ));
  }
}

ImageProvider getAvatarImageProvider(String imgUrl) {
  if (imgUrl == '' || imgUrl == null) {
    return AssetImage('images/userDefault.png');
  }
  return NetworkImage(imgUrl);
}
