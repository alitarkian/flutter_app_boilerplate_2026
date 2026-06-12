#!/bin/bash
echo "🧹 Cleaning..."
flutter clean
dart run build_runner clean

echo "📦 Getting packages..."
flutter pub get

echo "⚙️ Building..."
dart run build_runner build --delete-conflicting-outputs

echo "✅ Done!"