class UiData {
  String repoName;
  String ownerName;
  String avatar;
  String description;
  int starNo;
  int forkNo;
  double scores;
  DateTime updateDate;

  UiData(
      {this.repoName = '',
      this.ownerName = '',
      this.avatar = '',
      this.description = '',
      this.starNo = 0,
      this.forkNo = 0,
      this.scores = 0,
      required this.updateDate});
}
