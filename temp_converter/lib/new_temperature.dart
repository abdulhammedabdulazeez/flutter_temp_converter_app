import 'package:flutter/material.dart';
import 'package:temp_converter/display_models.dart';

class NewTemperature extends StatefulWidget {
  const NewTemperature({super.key, required this.onAddHistory});

  final void Function(History history) onAddHistory;

  @override
  State<NewTemperature> createState() => _NewTemperatureState();
}

class _NewTemperatureState extends State<NewTemperature> {
  final tempInputController = TextEditingController();
  Temperature selectedTemperature = Temperature.fahrenheit;

  void seeResult() {
    final tempInput = double.tryParse(tempInputController.text);
    double degree = (tempInput! - 32) * 5 / 9;
    if (selectedTemperature == Temperature.celsius) {
      degree = degree = (tempInput * 9 / 5) + 32; 
    }

    degree = double.parse(degree.toStringAsFixed(2));

    widget.onAddHistory(
      History(
        fromDegree: tempInput, 
        convertedFrom: selectedTemperature, 
        toDegree: degree, 
        convertedTo: selectedTemperature == Temperature.fahrenheit ? Temperature.celsius : Temperature.fahrenheit,
    ));

    Navigator.pop(context);

  }

  @override
  void dispose() {
    tempInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          DropdownButton(
            value: selectedTemperature,
            items: Temperature.values
                .map(
                  (temp) => DropdownMenuItem(
                    value: temp,
                    child: Text(temp.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                selectedTemperature = value;
              });
            },
          ),
          const SizedBox(height: 50),
          TextField(
            controller: tempInputController,
            keyboardType: TextInputType.number,
            maxLength: 5,
            decoration: const InputDecoration(
              label: Text('Input degree'),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: seeResult,
                child: const Text('See Result'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
