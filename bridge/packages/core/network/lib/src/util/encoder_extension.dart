import 'dart:convert';

import 'package:core_common/common.dart';

extension RequestEncoder on Encodable {
  String get json => jsonEncode(this);
}
