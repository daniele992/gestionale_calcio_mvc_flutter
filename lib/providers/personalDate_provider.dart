import 'package:flutter_riverpod/flutter_riverpod.dart';

//PERSONAL DATE
final namePlayerProvider = StateProvider<String?>((ref) => null);
final surnamePlayerProvider = StateProvider<String?>((ref) => null);
final teamPlayProvider = StateProvider<String?>((ref) => null);
final dateOfBirthdayProvider = StateProvider<DateTime?>((ref) => null);

final currentDateProvider = Provider<DateTime>((ref) {
  return ref.watch(dateOfBirthdayProvider) ?? DateTime.now();
});