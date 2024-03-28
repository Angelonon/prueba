// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import 'crossword_generator_widget.dart';
import 'crossword_puzzle_widget.dart';
import 'puzzle_completed_widget.dart';

class CrosswordPuzzleApp extends ConsumerWidget {
  const CrosswordPuzzleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamePhase = ref.watch(gamePhaseProvider);

    return _EagerInitialization(
      child: Scaffold(
        appBar: AppBar(
          actions: [_CrosswordPuzzleAppMenu()],
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          title: Text('Crossword Puzzle'),
        ),
        body: SafeArea(
          child: switch (gamePhase) {
            GamePhase.loading => Center(child: CircularProgressIndicator()),
            GamePhase.generatePuzzle => CrosswordGeneratorWidget(),
            GamePhase.playPuzzle => CrosswordPuzzleWidget(),
            GamePhase.completedPuzzle => PuzzleCompletedWidget(),
          },
        ),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wordListProvider);
    return child;
  }
}

class _CrosswordPuzzleAppMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => MenuAnchor(
        menuChildren: [
          for (final entry in CrosswordSize.values)
            MenuItemButton(
              onPressed: () => ref.read(sizeProvider.notifier).setSize(entry),
              leadingIcon: entry == ref.watch(sizeProvider)
                  ? Icon(Icons.radio_button_checked_outlined)
                  : Icon(Icons.radio_button_unchecked_outlined),
              child: Text(entry.label),
            ),
        ],
        builder: (context, controller, child) => IconButton(
          onPressed: () => controller.open(),
          icon: Icon(Icons.settings),
        ),
      );
}
