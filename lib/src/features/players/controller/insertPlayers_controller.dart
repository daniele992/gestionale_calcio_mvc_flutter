import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/models/player_model.dart';
import '../../../../providers/personalDate_provider.dart';
import '../../../../providers/physicalDate_provider.dart';
import '../../../../providers/ratingDate_provider.dart';

class insertPlayersController{

  late final Ref ref;

  insertPlayersController(this.ref);

  Future<void> submitPlayer() async {

        //PERSONAL DATE
       final name = ref.watch(namePlayerProvider);
       final surname = ref.watch(surnamePlayerProvider);
       final dateOfBirth= ref.watch(dateOfBirthdayProvider);
       final team = ref.watch(teamPlayProvider);
       final nationality = ref.watch(nationSelectedProvider);
       final continent =  ref.watch(continentProvider);

       //PHYSICAL DATE
       final weight = ref.watch(weightPlayerProvider);
       final height = ref.watch(heightPlayerProvider);
       final somatotype = ref.watch(somatotypeSelectedProvider)?.name;
       final biotype = ref.watch(biotypeSelectedProvider)?.name;
       final build = ref.watch(buildSelectedProvider)?.name;
       final foot = ref.watch(preferredFootProvider);

       //RATING DATE
       final dateObservation = ref.watch(dateObservationProvider);
       final ratingTec = ref.watch(ratingTechniqueProvider);
       final ratingInt = ref.watch(ratingIntelligenceProvider);
       final ratingPers = ref.watch(ratingPersonalityProvider);
       final ratingSpeed = ref.watch(ratingSpeedProvider);
       final structure = ref.watch(ratingStructureProvider);
       final totalTipss = ref.watch(totalRating);
       final comment = ref.watch(commentTextProvider);

            final user = FirebaseAuth.instance.currentUser;

            if(user == null){throw Exception('Utente non autenticato');}

            final personalData = PersonalDate(
                name: name ?? '',
                surname: surname ?? '',
                dateOfBirth: dateOfBirth?.toIso8601String() ?? '',
                 team: team ?? '',
                 nationality: nationality?.name ?? '',
                 continent: continent ?? '',
            );

            final physicalData = PhysicalDate(
                 height: height ?? '',
                 weight: weight ?? '',
                 somatotype: somatotype ?? '',
                 biotype: biotype ?? '',
                 build: build ?? '',
                 foot: foot ?? '',
            );

            final ratingData = Rating(
                 dateObservation: dateObservation?.toIso8601String() ?? '',
                 technique: ratingTec ?? 0.0,
                 intelligence: ratingInt ?? 0.0,
                 personality: ratingPers ?? 0.0,
                 speed: ratingSpeed ?? 0.0,
                 structure: structure ?? 0.0,
                 comment: comment ?? '',
                 totalTipss: totalTipss!,
            );

            final player = PlayerModel(
                id: user.uid,
                personalDate: personalData,
                physicalDate: physicalData,
                rating: ratingData,
            );

            //SAVE IN FIRESTORE
            await FirebaseFirestore.instance
                .collection('players').
                add(player.toJson(uid: user.uid));

  }
}