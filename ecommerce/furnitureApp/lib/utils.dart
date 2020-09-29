// ADDITIONAL

import 'dart:ui';

/// Convert a color hex-string to a Color object.
Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

// // example usage
// Text(
//   'hello world',
//   style: TextStyle(
//     color: getColorFromHex('#aabbcc'),
//     fontWeight: FontWeight.bold,
//   )
// )