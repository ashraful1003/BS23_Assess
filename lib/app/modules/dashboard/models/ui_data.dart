import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';

class UiData {
  String repoName;
  Owner owner;
  String description;
  int starNo;
  int forkNo;
  double scores;
  DateTime updateDate;

  UiData(
      {this.repoName = '',
      required this.owner,
      this.description = '',
      this.starNo = 0,
      this.forkNo = 0,
      this.scores = 0,
      required this.updateDate});
}
