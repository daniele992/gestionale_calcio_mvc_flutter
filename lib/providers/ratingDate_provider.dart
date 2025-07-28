import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateObservationProvider = StateProvider<DateTime?>((ref) => null);
final ratingTechniqueProvider = StateProvider<double?>((ref) => null);
final ratingIntelligenceProvider = StateProvider<double?>((ref) => null);
final ratingPersonalityProvider = StateProvider<double?>((ref) => null);
final ratingSpeedProvider = StateProvider<double?>((ref) => null);
final ratingStructureProvider = StateProvider<double?>((ref) => null);
final commentTextProvider = StateProvider<String?>((ref) => null);


final totalRating = Provider<double>((ref) {
  final valTechnique = ref.watch(ratingTechniqueProvider);
  final valIntelligence = ref.watch(ratingIntelligenceProvider);
  final valPersonality = ref.watch(ratingPersonalityProvider);
  final valSpeed = ref.watch(ratingSpeedProvider);
  final valStructure = ref.watch(ratingStructureProvider);
  return (valTechnique ?? 0.0) +
      (valIntelligence ?? 0.0) +
      (valPersonality ?? 0.0) +
      (valSpeed ?? 0.0) +
      (valStructure ?? 0.0);
});