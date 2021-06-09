class ShoppingGroup {
  final String groupId;
  final String groupName;
  final String timeStamp;

  ShoppingGroup(
      {required this.groupId,
      required this.groupName,
      required this.timeStamp});

  factory ShoppingGroup.fromJson(Map<String, dynamic> json) {
    return ShoppingGroup(
      groupId: json['groupId'] as String,
      groupName: json['groupName'] as String,
      timeStamp: json['timeStamp'] as String,
    );
  }
}
