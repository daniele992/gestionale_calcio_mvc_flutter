class Nationality{
  final int id;
  final String name;
  final String iso2;
  final String iso3;
  final String flag;
  final String language;
  final String continent;

  Nationality({
    required this.id,
    required this.name,
    required this.iso2,
    required this.iso3,
    required this.flag,
    required this.language,
    required this.continent
});

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      id: json['id'],
      name: json['name'],
      iso2: json['iso2'],
      iso3: json['iso3'],
      flag: json['flag'],
      language: json['language'],
      continent: json['continent'],
    );
  }

}