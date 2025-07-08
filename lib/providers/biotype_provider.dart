import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/features/players/models/biotype_model.dart';

final biotypeProvider = FutureProvider<List<Biotype>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/json/biotype.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => Biotype.fromJson(e)).toList();
});

final biotypeSelectedProvider = StateProvider<Biotype?>((ref) => null);