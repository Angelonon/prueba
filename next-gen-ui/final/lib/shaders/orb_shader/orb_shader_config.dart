import 'package:flutter/material.dart';

class OrbShaderConfig {
  OrbShaderConfig({
    this.zoom = 0.3,
    this.exposure = 0.4,
    this.roughness = 0.3,
    this.metalness = 0.3,
    this.materialColor = const Color.fromARGB(255, 242, 163, 138),
    this.lightRadius = 0.75,
    this.lightColor = const Color(0xFFFFFFFF),
    this.lightBrightness = 15.00,
    this.ior = 0.5,
    this.lightAttenuation = 0.5,
    this.ambientLightColor = const Color(0xFFFFFFFF),
    this.ambientLightBrightness = 0.2,
    this.ambientLightDepthFactor = 0.3,
    this.lightOffsetX = 0,
    this.lightOffsetY = 0.1,
    this.lightOffsetZ = -0.66,
  });

  /// 0..1
  double zoom;

  /// 0..inf,  camera exposure value, higher is brighter, 0 is black
  double exposure;

  /// 0..1 how rough the surface is, somewhat translates to the intensity/radius of specular highlights
  double roughness;

  /// 0..1, 0 for a dielectric material (plastic, wood, grass, water, etc...),
  /// 1 for a metal (iron, copper, aluminum, gold, etc...) a value in between
  /// blends the two materials (not really physically accurate, has minimal artistic value)
  double metalness;

  /// any color, alpha ignored, for metal materials doesn't correspond to surface color
  /// but to a reflectivity index based off of a 0 degree viewing angle (can look these
  /// values up online for various actual metals)
  Color materialColor;

  /// The following light properties model a disk shaped light pointing at the sphere
  /// 0.1..inf
  double lightRadius;

  /// alpha ignored
  Color lightColor;

  /// 1..inf measured in luminous power (perceived total brightness of light, the larger the radius the more diffused the light power is for a given area)
  double lightBrightness;

  /// 0..2, Index of refraction, higher value = more refraction,
  double ior;

  /// 0..1, Light attenuation factor, 0 for no attenuation, 1 is very fast attenuation
  double lightAttenuation;

  /// alpha ignored
  Color ambientLightColor;

  /// 0..inf
  double ambientLightBrightness;

  /// 0..1, modulates the ambient light brightness based off of the depth of the pixel. 1 means the ambient
  /// brightness factor at the front of the orb is 0, brightness factor at the back is 1. 0 means there's no
  /// change to the brightness factor based on depth
  double ambientLightDepthFactor;

  /// Offset of the light relative to the center of the orb, +x is to the right
  double lightOffsetX;

  /// Offset of the light relative to the center of the orb, +y is up
  double lightOffsetY;

  /// Offset of the light relative to the center of the orb, +z is facing the camera
  double lightOffsetZ;

  OrbShaderConfig copyWith({
    double? zoom,
    double? exposure,
    double? roughness,
    double? metalness,
    Color? materialColor,
    double? lightRadius,
    Color? lightColor,
    double? lightBrightness,
    double? ior,
    double? lightAttenuation,
    Color? ambientLightColor,
    double? ambientLightBrightness,
    double? ambientLightDepthFactor,
    double? lightOffsetX,
    double? lightOffsetY,
    double? lightOffsetZ,
  }) {
    return OrbShaderConfig(
      zoom: zoom ?? this.zoom,
      exposure: exposure ?? this.exposure,
      roughness: roughness ?? this.roughness,
      metalness: metalness ?? this.metalness,
      materialColor: materialColor ?? this.materialColor,
      lightRadius: lightRadius ?? this.lightRadius,
      lightColor: lightColor ?? this.lightColor,
      lightBrightness: lightBrightness ?? this.lightBrightness,
      ior: ior ?? this.ior,
      lightAttenuation: lightAttenuation ?? this.lightAttenuation,
      ambientLightColor: ambientLightColor ?? this.ambientLightColor,
      ambientLightBrightness:
          ambientLightBrightness ?? this.ambientLightBrightness,
      ambientLightDepthFactor:
          ambientLightDepthFactor ?? this.ambientLightDepthFactor,
      lightOffsetX: lightOffsetX ?? this.lightOffsetX,
      lightOffsetY: lightOffsetY ?? this.lightOffsetY,
      lightOffsetZ: lightOffsetZ ?? this.lightOffsetZ,
    );
  }
}
