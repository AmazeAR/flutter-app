class Description {
  final description;

  Description({required this.description});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      description: json['description'],
    );
  }
}
