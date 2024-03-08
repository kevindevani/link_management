import 'package:hive/hive.dart';

/// this is generate adapter
part "link_list_model.g.dart";

@HiveType(typeId: 0)
class LinkListModel {
  @HiveField(0)
  late final int linkId;
  @HiveField(1)
  late final String link;
  @HiveField(2)
  late final String title;

  LinkListModel({
    required this.linkId,
    required this.link,
    this.title = '',
  });
}
