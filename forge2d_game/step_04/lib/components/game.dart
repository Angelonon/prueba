// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';
import 'package:xml/xpath.dart';

import 'background.dart';

class MyPhysicsGame extends Forge2DGame {
  MyPhysicsGame()
      : super(
          gravity: Vector2(0, 10),
          cameraComponent:
              CameraComponent.withFixedResolution(width: 800, height: 600),
        );

  late final XmlSpriteSheet aliens;
  late final XmlSpriteSheet elements;
  late final XmlSpriteSheet tiles;

  @override
  FutureOr<void> onLoad() async {
    final loadedImages = await Future.wait([
      images.load('colored_grass.png'),
      images.load('spritesheet_aliens.png'),
      images.load('spritesheet_elements.png'),
      images.load('spritesheet_tiles.png'),
    ]);
    aliens = XmlSpriteSheet(loadedImages[1],
        await rootBundle.loadString('assets/spritesheet_aliens.xml'));
    elements = XmlSpriteSheet(loadedImages[2],
        await rootBundle.loadString('assets/spritesheet_elements.xml'));
    tiles = XmlSpriteSheet(loadedImages[3],
        await rootBundle.loadString('assets/spritesheet_tiles.xml'));

    await world.add(Background(sprite: Sprite(loadedImages[0])));

    return super.onLoad();
  }
}

class XmlSpriteSheet {
  XmlSpriteSheet(this.image, String xml) {
    final document = XmlDocument.parse(xml);
    for (final node in document.xpath('//TextureAtlas/SubTexture')) {
      final name = node.getAttribute('name')!;
      final x = double.parse(node.getAttribute('x')!);
      final y = double.parse(node.getAttribute('y')!);
      final width = double.parse(node.getAttribute('width')!);
      final height = double.parse(node.getAttribute('height')!);
      _rects[name] = Rect.fromLTWH(x, y, width, height);
    }
  }

  final ui.Image image;
  final _rects = <String, Rect>{};

  Sprite getSprite(String name) {
    final rect = _rects[name];
    if (rect == null) {
      throw ArgumentError('Sprite $name not found');
    }
    return Sprite(
      image,
      srcPosition: rect.topLeft.toVector2(),
      srcSize: rect.size.toVector2(),
    );
  }

  Map<ui.Size, List<String>> groupSpriteNamesBySize() {
    final groups = <ui.Size, List<String>>{};
    for (final entry in _rects.entries) {
      final size = entry.value.size;
      groups.putIfAbsent(size, () => []).add(entry.key);
    }

    return groups;
  }

  String groupElementsBySizeToString() {
    final groups = groupSpriteNamesBySize();
    final buff = StringBuffer();
    for (final size in groups.keys) {
      buff.writeln('## Size: $size');
      final entries = groups[size]!;
      entries.sort();
      for (final type in ['Explosive', 'Glass', 'Metal', 'Stone', 'Wood']) {
        buff.writeln('### $type');
        var where = entries.where((element) => element.contains(type));
        if (where.length == 5) {
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.none) => '${where.elementAt(0)}',");
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.some) => '${where.elementAt(1)}',");
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.lots) => '${where.elementAt(4)}',");
        } else if (where.length == 10) {
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.none) => '${where.elementAt(3)}',");
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.some) => '${where.elementAt(4)}',");
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.lots) => '${where.elementAt(9)}',");
        } else if (where.length == 15) {
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.none) => '${where.elementAt(7)}',");
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.some) => '${where.elementAt(8)}',");
          buff.writeln(
              "(BrickType.${type.toLowerCase()}, BrickSize.size${size.width.toInt()}x${size.height.toInt()}, BrickDamage.lots) => '${where.elementAt(13)}',");
        } else {
          buff.writeln(where.toList().join(', '));
        }
      }
    }
    return buff.toString();
  }

  String groupSpriteNamesBySizeToString() {
    final groups = groupSpriteNamesBySize();
    final buff = StringBuffer();
    for (final key in groups.keys) {
      buff.writeln('## Size: $key');
      buff.writeln(groups[key]!.toList()
        ..sort()
        ..join(', '));
    }
    return buff.toString();
  }
}
