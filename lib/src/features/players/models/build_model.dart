class Build {
  final int id;
  final String name;
  final String description;
  final String advantage;
  final String disadvantages;
  final String abbreviation;

  Build({
    required this.id,
    required this.name,
    required this.description,
    required this.advantage,
    required this.disadvantages,
    required this.abbreviation,
  });

  ///Factory returns an existing object or subclass and it does not necessarily return an instance
  factory Build.fromJson(Map<String, dynamic> json) {
    return Build(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      advantage: json['advantage'],
      disadvantages: json['disadvantages'],
      abbreviation: json['abbreviation'],
    );
  }
}