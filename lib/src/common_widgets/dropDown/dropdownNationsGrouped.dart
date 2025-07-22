import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/nationality_provider.dart';
import '../../constants/text_strings.dart';
import '../../features/players/models/nationality_model.dart';

class DropdownNationsWithFlags extends ConsumerWidget {
  const DropdownNationsWithFlags({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncNation = ref.watch(nationalityProvider);
    final nationSelected = ref.watch(nationSelectedProvider); // ✅ Usa quello globale

    return asyncNation.when(
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text("Error: $e"),
      data: (nation) {
        final Map<String, List<Nationality>> grouped = {};
        for (var n in nation) {
          grouped.putIfAbsent(n.continent, () => []).add(n);
        }

        final List<DropdownMenuItem<Nationality>> items = [];

        grouped.forEach((continent, nationsOfTheContinent) {
          // non-selectable header
          items.add(
            DropdownMenuItem<Nationality>(
              enabled: false,
              child: Text(
                continent,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
          );

          // selectable items with flags
          items.addAll(nationsOfTheContinent.map((n) {
            return DropdownMenuItem<Nationality>(
              value: n,
              child: Row(
                children: [
                  Image.network(
                    n.flag,
                    width: 24,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Text(n.name),
                ],
              ),
            );
          }));
        });

        return DropdownButtonFormField<Nationality>(
          isExpanded: true,
          hint: Text(tSelectCountry),
          decoration: InputDecoration(
            labelText: tNation,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          value: nationSelected,
          onChanged: (val) {
            ref.read(nationSelectedProvider.notifier).state = val; // ✅ aggiorna quello globale
          },
          items: items,
        );
      },
    );
  }
}