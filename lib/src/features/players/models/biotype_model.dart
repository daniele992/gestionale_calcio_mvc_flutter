class Biotype {
  final int id;
  final String name;
  final String description;
  final String abbreviation;

  Biotype({
    required this.id,
    required this.name,
    required this.description,
    required this.abbreviation,
  });

  ///Factory returns an existing object or subclass and it does not necessarily return an instance
  factory Biotype.fromJson(Map<String, dynamic> json) {
    return Biotype(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      abbreviation: json['abbreviation'],
    );
  }
}
