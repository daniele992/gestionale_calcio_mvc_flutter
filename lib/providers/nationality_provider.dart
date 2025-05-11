import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/models/nationality_model.dart';

final nationalityProvider = FutureProvider<List<Nationality>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/nationalities/nationalities.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => Nationality.fromJson(e)).toList();
});

final nationSelectedProvider = StateProvider<Nationality?>((ref) => null);