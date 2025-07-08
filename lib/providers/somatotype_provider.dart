import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/models/somatotype_model.dart';

final somatotypeProvider = FutureProvider<List<Somatotype>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/json/somatotype.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => Somatotype.fromJson(e)).toList();

});

final somatotypeSelectedProvider = StateProvider<Somatotype?>((ref) => null);