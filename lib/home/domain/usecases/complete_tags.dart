import 'package:best_wordpress_sites/home/domain/entities/tag.dart';

class CompleteTags {
  final List<Tag> tags;

  CompleteTags(this.tags);

  List<Tag> call(List<Tag> incompleteTags) {
    List<Tag> completeTags = [];

    for (var tag in incompleteTags) {
      try {
        completeTags.add(this.tags.firstWhere((element) => element.id == tag.id));
      } catch (e) {}
    }

    return completeTags;
  }
}
