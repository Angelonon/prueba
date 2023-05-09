#!/usr/bin/env bash

set -e -o pipefail

DIR="${BASH_SOURCE%/*}"
source "$DIR/flutter_ci_script_shared.sh"

declare -a CODELABS=(
  "adaptive_app"
  # TODO(DomesticMouse): 'SearchBar' isn't a function.
  # "animated-responsive-layout"
  "boring_to_beautiful"
  "cookbook"
  # TODO(DomesticMouse): Use 'const' with the constructor to improve performance.
  # "cupertino_store"
  "dart3"
  "dart-patterns-and-records"
  # TODO(DomesticMouse): Use 'const' with the constructor to improve performance.
  # "dartpad_codelabs"
  "deeplink_cookbook"
  "ffigen_codelab"
  # TODO(DomesticMouse): version solving failed.
  # "firebase-auth-flutterfire-ui"
  "firebase-emulator-suite"
  # TODO(DomesticMouse): version solving failed.
  # "firebase-get-to-know-flutter"
  "flame-building-doodle-dash"
  "github-client"
  "google-maps-in-flutter"
  "haiku_generator"
  # TODO(miquelbeltran): Use 'const' with the constructor to improve performance.
  # "in_app_purchases"
  "namer"
  "next-gen-ui"
  "star_counter"
  "testing_codelab"
  "tfagents-flutter"
  "tfrs-flutter"
  "tfserving-flutter"
  "tooling"
  "webview_flutter"
  )

ci_codelabs "beta" "${CODELABS[@]}"

echo "== END OF TESTS"
