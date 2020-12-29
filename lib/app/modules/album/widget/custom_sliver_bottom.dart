import 'package:flutter/material.dart';

class CustomSliverBottom extends SliverPersistentHeaderDelegate {
  final widget;
  final double max;
  final double min;

  CustomSliverBottom({this.max = 350, this.min = 60, this.widget});

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
