import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shimmer.fromColors(
      highlightColor: theme.backgroundColor,
      baseColor: theme.scaffoldBackgroundColor,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 12,
                    width: constraints.maxWidth - 70,
                    color: theme.scaffoldBackgroundColor,
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    height: 15,
                    width: constraints.maxWidth * 0.4,
                    color: theme.scaffoldBackgroundColor,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
