import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_personalDate_widget.dart';

import '../../authentication/view/login/widgets/login_form_widget.dart';

final formKeyProvider = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

class InsertPlayers extends ConsumerStatefulWidget {
  const InsertPlayers({super.key});

  @override
  ConsumerState<InsertPlayers> createState() => _InsertPlayersState();
}

class _InsertPlayersState extends ConsumerState<InsertPlayers> {
  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(formKeyProvider);

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.black),
            ),
            child: Container(
              width:MediaQuery.of(context).size.width * 0.75, // 60% height
              height: MediaQuery.of(context).size.height * 0.65, // 60% height
              padding: EdgeInsets.all(16),
              child: Form(
                child: FormPersonalDateWidget(),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: -12,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Dati Anagrafici',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
