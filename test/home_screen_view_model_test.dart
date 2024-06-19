import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:identifying_platform_sample/main.dart';

void main() {
  final viewModel = HomeScreenViewModel();

  group('成功するテスト：generateNumberForDefaultPlatform', () {
    tearDown(() {
      debugDefaultTargetPlatformOverride = null;
    });
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
    tearDown(() {
      debugDefaultTargetPlatformOverride = null;
    });
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
}
