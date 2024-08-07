import 'package:flutter/material.dart';
import 'package:temp_converter/display_models.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key,required this.history});

  final History history;

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.green.shade600,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 10),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(history.fromDegree.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(tempValue[history.convertedFrom].toString(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.keyboard_double_arrow_right_outlined
              ),
              const SizedBox(width: 20),
              Text(history.toDegree.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(tempValue[history.convertedTo].toString(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
  }
}