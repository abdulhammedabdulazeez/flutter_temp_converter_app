import 'package:flutter/material.dart';
import 'package:temp_converter/display_models.dart';
import 'package:temp_converter/history_item.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, required this.histories});

  final List<History> histories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: histories.length,
      itemBuilder: (context, index) {
        return HistoryItem(history: histories[index]);
      },
    );
  }
}
