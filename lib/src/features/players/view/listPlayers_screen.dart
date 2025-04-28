import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPlayers extends ConsumerStatefulWidget {
  const ListPlayers({super.key});

  @override
  ConsumerState<ListPlayers> createState() => _ListPlayersState();
}

class _ListPlayersState extends ConsumerState<ListPlayers> {

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(

      ),
    );
  }
}