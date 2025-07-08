import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/providers/biotype_provider.dart';

import '../../constants/text_strings.dart';
import '../../features/players/models/biotype_model.dart';

class BiotypeDropDown extends ConsumerWidget {
  const BiotypeDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBiotypes = ref.watch(biotypeProvider);
    final selectedBiotype = ref.watch(biotypeSelectedProvider);

    return asyncBiotypes.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text("Errore: $e"),
      data: (biotypeList) {
        return DropdownButtonFormField<Biotype>(
          isExpanded: true,
          decoration: InputDecoration(labelText: tBiotype),
          value: selectedBiotype,
          hint: const Text("Seleziona il biotipo"),
          onChanged: (val) {
            ref.read(biotypeSelectedProvider.notifier).state = val;
          },
          items: biotypeList.map((biotype) {
            return DropdownMenuItem<Biotype>(
              value: biotype,
              child: Text(biotype.name),
            );
          }).toList(),
          validator: (value) {
            if (value == null) return 'Seleziona un biotipo valido';
            return null;
          },
        );
      },
    );
  }
}
