// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(viewModel: HomeScreenViewModel()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.viewModel,
    super.key,
  });

  final HomeScreenViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '現在の値は$number',
              style: const TextStyle(fontSize: 40),
            ),
            const Gap(50),
            ElevatedButton(
              child: const Text('PlatformIsで判別'),
              onPressed: () {
                setState(() {
                  final result = widget.viewModel.generateNumberForPlatform();
                  number = result;
                });
              },
            ),
            const Gap(50),
            ElevatedButton(
              child: const Text('DefaultPlatformで判別'),
              onPressed: () {
                setState(() {
                  final result =
                      widget.viewModel.generateNumberForDefaultPlatform();
                  number = result;
                });
              },
            ),
            const Gap(50),
            ElevatedButton(
              child: const Text('リセット'),
              onPressed: () {
                setState(() {
                  number = 0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenViewModel {
  /// Platform.isXxxで判定する
  int generateNumberForPlatform() {
    if (Platform.isAndroid) {
      return 1;
    } else if (Platform.isIOS) {
      return 2;
    }
    return 3;
  }

  /// defaultTargetPlatform == TargetPlatform.xxxで判定する
  int generateNumberForDefaultPlatform() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 1;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 2;
    }
    return 3;
  }
}
