

enum Temperature {fahrenheit, celsius}

const tempValue = {
  Temperature.celsius: '℃',
  Temperature.fahrenheit: '℉'
};

class History {
  History({
    required this.fromDegree,
    required this.convertedFrom,
    required this.toDegree,
    required this.convertedTo
  });

  final double fromDegree;
  final Temperature convertedFrom;
  final double toDegree;
  final  Temperature convertedTo;
}