class ShoppingGroup {
  final String groupId;

  ShoppingGroup({required this.groupId});

  factory ShoppingGroup.fromJson(Map<String, dynamic> json) {
    return ShoppingGroup(
      groupId: json['groupId'] as String,
    );
  }
}
