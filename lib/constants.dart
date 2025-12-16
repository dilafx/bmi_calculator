



import 'package:flutter/material.dart' show Color, BoxDecoration, BorderRadius;

const kTileColor = Color(0xFF1D1E33);
const kSelectedTileColor =Color.fromARGB(255, 50, 25, 58);
const kActiveTextColor = Color(0xFFffffff);
const kInactiveTextColor=Color(0xFf8D8E98);
const kBackgroundColor=Color.fromARGB(255, 45, 10, 48);

   var kTileBorderDecoration = BoxDecoration(
          color: kTileColor,
          borderRadius: BorderRadius.circular(5),
          );

        
     var kSelectedTileBorderDecoration = BoxDecoration(
          color: kSelectedTileColor,
          borderRadius: BorderRadius.circular(5),
          );