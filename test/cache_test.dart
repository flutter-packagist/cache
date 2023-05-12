import 'package:flutter_test/flutter_test.dart';

import 'package:cache/cache.dart';

void main() {
  _testSp();

}

void _testSp() async{
  await SpManager.init();
  SpManager.setBool("test", true);
  SpManager.getBool("test", defaultValue: true);
}
