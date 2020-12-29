import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InfiniteScrollFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    return CustomFooter(
      builder: (context, mode) {
        Widget body;
        switch (mode) {
          case LoadStatus.idle:
            body = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.arrow_upward, color: _colorScheme.primary),
                SizedBox(width: 10),
                Text(
                  "Pull Up Load More",
                  style: TextStyle(color: _colorScheme.onPrimary.withOpacity(0.5), fontSize: 12),
                ),
              ],
            );
            break;
          case LoadStatus.loading:
            body = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(_colorScheme.primary),
                  ),
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 10),
                Text(
                  "Loading...",
                  style: TextStyle(color: _colorScheme.onPrimary.withOpacity(0.5), fontSize: 12),
                ),
              ],
            );
            break;
          case LoadStatus.failed:
            body = Center(
              child: Text(
                "Load Failed! Click to retry!",
                style: TextStyle(color: _colorScheme.error.withOpacity(0.5), fontSize: 12),
              ),
            );
            break;
          case LoadStatus.canLoading:
            body = Center(
              child: Text(
                "Release To Load More",
                style: TextStyle(color: _colorScheme.onPrimary.withOpacity(0.5), fontSize: 12),
              ),
            );
            break;
          default:
            body = Center(
              child: Text(
                "No More Data",
                style: TextStyle(color: _colorScheme.onPrimary.withOpacity(0.5), fontSize: 12),
              ),
            );
        }
        return Container(
          height: 55.0,
          child: body,
        );
      },
    );
  }
}
