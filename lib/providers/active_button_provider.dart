import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ActiveButton {
  trend,
  local,
  mostRecently,
}

class ActiveButonNotifier extends StateNotifier<ActiveButton> {
  ActiveButonNotifier() : super(ActiveButton.trend);

  void changeActiveButton(ActiveButton activeButton) {
    state = activeButton;
  }
}

final activeButtonProvider =
    StateNotifierProvider<ActiveButonNotifier, ActiveButton>(
        (ref) => ActiveButonNotifier());
