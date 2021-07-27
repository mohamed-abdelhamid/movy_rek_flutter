import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Rate {
  Rate({
    @required rating,
  }) {
    this._rating = rating;
  }

  double _rating;

  get rating => _rating;

  set rating(double rate) => _rating;
}
class PrimitiveWrapper {
  var value;
  PrimitiveWrapper(this.value);
}
