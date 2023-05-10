#!/usr/bin/env bash

set -e -o pipefail

DIR="${BASH_SOURCE%/*}"
source "$DIR/flutter_ci_script_shared.sh"

declare -a CODELABS=(
  "adaptive_app"
  "animated-responsive-layout"
  "boring_to_beautiful"
  "cookbook"
  "cupertino_store"
  # TODO(DomesticMouse): enable on Flutter stable increment
  # "dart3"
  # TODO(DomesticMouse): enable on Flutter stable increment
  # "dart-patterns-and-records"
  "dartpad_codelabs"
  "deeplink_cookbook"
  "ffigen_codelab"
  "firebase-auth-flutterfire-ui"
  "firebase-emulator-suite"
  "firebase-get-to-know-flutter"
  "flame-building-doodle-dash"
  "github-client"
  "google-maps-in-flutter"
  # TODO(DomesticMouse): enable on Flutter stable increment
  # "haiku_generator"
  "in_app_purchases"
  "namer"
  # TODO(DomesticMouse): enable on Flutter stable increment
  # "next-gen-ui"
  "star_counter"
  "testing_codelab"
  "tfagents-flutter"
  "tfrs-flutter"
  "tfserving-flutter"
  "tooling"
  "webview_flutter"
  )

ci_codelabs "stable" "${CODELABS[@]}"

echo "== END OF TESTS"
