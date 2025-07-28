import 'package:cloud_firestore/cloud_firestore.dart';

//Model for creation player

class PersonalDate {
  final String name;
  final String surname;
  final String dateOfBirth;
  final String team;
  final String nationality;
  final String continent;

  const PersonalDate({
    required this.name,
    required this.surname,
    required this.dateOfBirth,
    required this.team,
    required this.nationality,
    required this.continent,
  });

  //To save to Firestore, you need to convert the model to a Map<String, Dynamic>. Add the toJson() method to all models:
  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'dateOfBirth': dateOfBirth,
        'team': team,
        'nationality': nationality,
        'continent': continent
      };
}

class PhysicalDate {
  final String height;
  final String weight;
  final String somatotype;
  final String biotype;
  final String build;
  final String foot;

  const PhysicalDate({
    required this.height,
    required this.weight,
    required this.somatotype,
    required this.biotype,
    required this.build,
    required this.foot,
  });

  //To save to Firestore, you need to convert the model to a Map<String, Dynamic>. Add the toJson() method to all models:
  Map<String, dynamic> toJson() => {
        'height': height,
        'weight': weight,
        'somatotype': somatotype,
        'biotype': biotype,
        'build': build,
        'foot': foot,
      };
}

class Rating {
  final String dateObservation;
  final double technique;
  final double intelligence;
  final double personality;
  final double speed;
  final double structure;
  final String comment;
  final double totalTipss;

  const Rating(
      {required this.dateObservation,
      required this.technique,
      required this.intelligence,
      required this.personality,
      required this.speed,
      required this.structure,
      required this.comment,
      required this.totalTipss});

  //To save to Firestore, you need to convert the model to a Map<String, Dynamic>. Add the toJson() method to all models:
  Map<String, dynamic> toJson() => {
        'dateObservation': dateObservation,
        'technique': technique,
        'intelligence': intelligence,
        'personality': personality,
        'speed': speed,
        'structure': structure,
        'comment': comment,
        'totalTipss': totalTipss,
      };
}

class PlayerModel {
  final String? id;
  final PersonalDate personalDate;
  final PhysicalDate physicalDate;
  final Rating rating;

  const PlayerModel({
      required this.id,
      required this.personalDate,
      required this.physicalDate,
      required this.rating
      });

  Map<String, dynamic> toJson({required String uid}) => {
        'uid': uid,
        'personalData': personalDate.toJson(),
        'physicalData': physicalDate.toJson(),
        'rating': rating.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
      };
}
