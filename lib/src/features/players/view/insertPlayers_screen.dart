import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/sizes.dart';

class InsertPlayers extends ConsumerStatefulWidget {
  const InsertPlayers({super.key});

  @override
  ConsumerState<InsertPlayers> createState() => _InsertPlayersState();
}

class _InsertPlayersState extends ConsumerState<InsertPlayers> {

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDashboardPadding),
        child: Column(

        ),
      ),
    );
  }
}