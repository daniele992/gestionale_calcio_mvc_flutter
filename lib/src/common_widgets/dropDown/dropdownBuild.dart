import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/physicalDate_provider.dart';
import '../../constants/text_strings.dart';
import '../../features/players/models/build_model.dart';

class BuildDropDown extends ConsumerWidget {
  const BuildDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStructure = ref.watch(buildProvider);
    final selectedStructure= ref.watch(buildSelectedProvider);

    return asyncStructure.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text(tError + e.toString()),
      data: (buildList) {
        return DropdownButtonFormField<Build>(
          isExpanded: true,
          decoration: InputDecoration(labelText: tBuild),
          value: selectedStructure,
          hint: const Text(tSelBuild),
          onChanged: (val) {
            ref.read(buildSelectedProvider.notifier).state = val;
          },
          items: buildList.map((build) {
            return DropdownMenuItem<Build>(
              value: build,
              child: Text(build.name ?? 'Nome sconosciuto'),
            );
          }).toList(),
          validator: (value) {
            if (value == null) return 'Seleziona una corporatura valida';
            return null;
          },
        );
      },
    );
  }
}