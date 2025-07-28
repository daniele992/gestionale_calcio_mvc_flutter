import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/features/players/controller/insertPlayers_controller.dart';

final insertPlayersControllerProvider = Provider<insertPlayersController>((ref) => insertPlayersController(ref),);
