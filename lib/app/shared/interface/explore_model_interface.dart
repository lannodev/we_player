import '../models/thumb_model.dart';

abstract class IExplore {
  String title;
  String subtitle;
  String type;
  int count;
  String source;
  String id;
  String nextFrom;
  List<ThumbModel> thumbs;
}
