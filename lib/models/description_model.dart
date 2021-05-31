class Description {
  final String description;

  Description({required this.description});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      description: json['description'],
    );
  }
}
