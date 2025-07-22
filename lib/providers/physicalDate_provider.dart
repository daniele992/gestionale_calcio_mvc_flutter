import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/models/build_model.dart';
import '../src/features/players/models/biotype_model.dart';
import '../src/features/players/models/somatotype_model.dart';

final heightPlayerProvider = StateProvider<String?>((ref) => null);
final weightPlayerProvider = StateProvider<String?>((ref) => null);
final preferredFootProvider = StateProvider<String?>((ref) => null);
//final build = Provider<List<String?>>((ref){return ['Esile', 'Media', 'Robusta']; });

final somatotypeProvider = FutureProvider<List<Somatotype>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/json/somatotype.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => Somatotype.fromJson(e)).toList();

});

final biotypeProvider = FutureProvider<List<Biotype>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/json/biotype.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => Biotype.fromJson(e)).toList();
});

final buildProvider = FutureProvider<List<Build>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/json/build.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => Build.fromJson(e)).toList();
});

final biotypeSelectedProvider = StateProvider<Biotype?>((ref) => null);
final somatotypeSelectedProvider = StateProvider<Somatotype?>((ref) => null);
final buildSelectedProvider = StateProvider<Build?>((ref) => null);