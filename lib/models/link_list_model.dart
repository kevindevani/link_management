import 'package:hive/hive.dart';

/// this is generate adapter
part "link_list_model.g.dart";

@HiveType(typeId: 0)
class LinkListModel {
  @HiveField(0)
  late final String link;
  @HiveField(1)
  late final bool title;

  LinkListModel({
    required this.link,
    required this.title,
  });
}
