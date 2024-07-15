import 'package:flutter/material.dart';
import 'package:temp_converter/history_item.dart';
import 'package:temp_converter/history_list.dart';
import 'package:temp_converter/display_models.dart';
import 'package:temp_converter/new_temperature.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final List<History> histories = [
    // History(
    //   fromDegree: 75,
    //   convertedFrom: Temperature.celsius,
    //   toDegree: 32.5,
    //   convertedTo: Temperature.fahrenheit,
    // ),
    // History(
    //   fromDegree: 75,
    //   convertedFrom: Temperature.celsius,
    //   toDegree: 32.5,
    //   convertedTo: Temperature.fahrenheit,
    // ),
    // History(
    //   fromDegree: 75,
    //   convertedFrom: Temperature.celsius,
    //   toDegree: 32.5,
    //   convertedTo: Temperature.fahrenheit,
    // ),
  ];

  void _openTemperatureOverlay() {
    showModalBottomSheet(
      // isScrollControlled: true,

      context: context,
      builder: (ctx) => NewTemperature(onAddHistory: addToHistory),
    );
  }

  void addToHistory(History history) {
    setState(() {
      histories.insert(0, history);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
        backgroundColor: Colors.green.shade200,
        
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 80, top: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (histories.isNotEmpty)
                Column(
                  children: [
                    const Text(
                      'Result:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    HistoryItem(history: histories[0])
                  ],
                ),
              // const SizedBox(height: 20),
              const Spacer(),
              ElevatedButton(
                onPressed: _openTemperatureOverlay,
                child: const Text('New Conversion',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              const Spacer(),
              // const SizedBox(height: 40),
              const Text(
                'History:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              if (histories.isEmpty)
                const Text('Your  conversion history will be displayed here!')
              else
                Expanded(child: HistoryList(histories: histories)),
            ],
          ),
        ),
      ),
    );
  }
}
