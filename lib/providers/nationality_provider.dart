import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/models/nationality_model.dart';

//Step-by-step explanation
//nationalityProvider: Provides a list of Nationality objects loaded from a local JSON
//rootBundle.loadString('assets/json/json.json'): Reads the JSON file as a string from the assets package.
//jsonDecode: Decodes the JSON string into a list of generic objects.
//list.map((e) => Nationality.fromJson(e)).toList(): Transforms each JSON element into an instance of the Nationality class using the fromJson method.
//StateProvider: Keeps track of the selected nationality.


///Loads the list of json from a JSON asynchronously.
final nationalityProvider = FutureProvider<List<Nationality>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/json/json.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => Nationality.fromJson(e)).toList();
});


///Keeps track of which nationality has been selected at any given moment
final nationSelectedProvider = StateProvider<Nationality?>((ref) => null);