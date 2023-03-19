// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

class UiScaler extends StatelessWidget {
  const UiScaler({super.key, required this.child, required this.alignment});

  static const _refHeight = 1080;
  final Widget child;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double scale = min(screenSize.height / _refHeight, 1.0);
    return Transform.scale(
      scale: scale,
      alignment: alignment,
      child: child,
    );
  }
}
