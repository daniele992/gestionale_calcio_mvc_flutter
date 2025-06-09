//Model for creation player

import 'dart:ffi';

class PersonalDate {
  final String name;
  final String surname;
  final String dateOfBirth;
  final String nationality;

  const PersonalDate({
    required this.name,
    required this.surname,
    required this.dateOfBirth,
    required this.nationality
  });
}

class PhysicalDate {
  final String height;
  final String weight;
  final String foot;
  final String structure;

  const PhysicalDate({
    required this.height,
    required this.weight,
    required this.foot,
    required this.structure
  });

}

class Rating {
  final String dateObservation;
  final double technique;
  final double intelligence;
  final double personality;
  final double speed;
  final double structure;
  final String comment;

  const Rating({
    required this.dateObservation,
    required this.technique,
    required this.intelligence,
    required this.personality,
    required this.speed,
    required this.structure,
    required this.comment
  });

}


class PlayerModel{
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

  /* toJson(){
    return {
      "Name": name,
      "Surname": surname,
      "DateOfBirthday": dateOfBirth,
      ""
    };
  } */

}


