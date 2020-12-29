import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const EmptyWidget({Key key, @required this.title, @required this.subtitle, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SvgPicture.asset(
          //   image,
          //   width: MediaQuery.of(context).size.width * 0.5,
          // ),
          SizedBox(height: 16.0),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Theme.of(context).accentColor.withOpacity(0.5),
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
