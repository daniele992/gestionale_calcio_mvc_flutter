import 'package:flutter_riverpod/flutter_riverpod.dart';

final ratingTechnique = StateProvider<double?>((ref) => null);
final ratingIntelligence = StateProvider<double?>((ref) => null);
final ratingPersonality = StateProvider<double?>((ref) => null);
final ratingSpeed = StateProvider<double?>((ref) => null);
final ratingStructure = StateProvider<double?>((ref) => null);

final totalRating = Provider<double>((ref) {
  final valTechnique = ref.watch(ratingTechnique);
  final valIntelligence = ref.watch(ratingIntelligence);
  final valPersonality = ref.watch(ratingPersonality);
  final valSpeed = ref.watch(ratingSpeed);
  final valStructure = ref.watch(ratingStructure);
  return (valTechnique ?? 0.0) +
      (valIntelligence ?? 0.0) +
      (valPersonality ?? 0.0) +
      (valSpeed ?? 0.0) +
      (valStructure ?? 0.0);
});
