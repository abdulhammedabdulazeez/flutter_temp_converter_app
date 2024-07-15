import 'package:flutter/material.dart';
import 'package:temp_converter/converter_screen.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 77, 183, 58)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ConverterScreen(),
    ));
}

