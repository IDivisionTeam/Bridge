import 'dart:convert';

import 'package:common/common.dart';

extension RequestEncoder on Encodable {
  String get json => jsonEncode(this);
}
