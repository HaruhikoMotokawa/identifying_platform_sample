import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:identifying_platform_sample/main.dart';

void main() {
  final viewModel = HomeScreenViewModel();

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  group('成功するテスト：generateNumberForDefaultPlatform', () {
    test('androidの場合', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final result = viewModel.generateNumberForDefaultPlatform();
      expect(result, 1);
    });
    test('iOSの場合', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final result = viewModel.generateNumberForDefaultPlatform();
      expect(result, 2);
    });
  });

  group('失敗するテスト：generateNumberForPlatform', () {
    test('androidの場合', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final result = viewModel.generateNumberForPlatform();
      expect(result, 1);
    });
    test('iOSの場合', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final result = viewModel.generateNumberForPlatform();
      expect(result, 2);
    });
  });
  group('testOnでテスト', () {
    // testOn引数は結局のところテストの実行環境が引数だったら実行されるということ
    // つまりPCがmacだったらmacOSでないと動かない
    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    });

    test(
        'mac-osでテストするけど、'
        'TargetPlatformは偽装できないので失敗',
        testOn: 'mac-os', () {
      final result = viewModel.generateNumberForPlatform();
      expect(result, 2);
    });
    test(
        'ioSでテストするけど、TargetPlatformが偽装されてるわけではないので、'
        'そもそも動かないテスト',
        testOn: 'ios', () {
      final result = viewModel.generateNumberForPlatform();
      expect(result, 2);
    });
  });
}
