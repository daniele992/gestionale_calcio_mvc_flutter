import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/somatotype_provider.dart';
import '../../constants/text_strings.dart';
import '../../features/players/models/somatotype_model.dart';

class SomatotypeDropDown extends ConsumerWidget {
  const SomatotypeDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSomatotypes = ref.watch(somatotypeProvider);
    final selectedBiotype = ref.watch(somatotypeSelectedProvider);

    return asyncSomatotypes.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text("Errore: $e"),
      data: (biotypeList) {
        return DropdownButtonFormField<Somatotype>(
          isExpanded: true,
          decoration: InputDecoration(labelText: tSomatotype),
          value: selectedBiotype,
          hint: const Text("Seleziona il somatotipo"),
          onChanged: (val) {
            ref.read(somatotypeSelectedProvider.notifier).state = val;
          },
          items: biotypeList.map((biotype) {
            return DropdownMenuItem<Somatotype>(
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
