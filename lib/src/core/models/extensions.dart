import 'package:clash_flutter/src/core/models/turn.dart';

extension TurnFunc on Turn {

  Turn fromFireBaseData(String turn) {
    if(turn == name) {
      return this;
    }
    else {
      return Turn.guest;
    }
  }
}