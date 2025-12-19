import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  bool isMale = true;
  double height = 183;
  int weight = 74;
  int age = 30;
  double? bmi;

  double calculateBMI({required int weight, required double height}) {
    return weight / ((height / 100) * (height / 100));
  }

  Color getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        foregroundColor: kActiveTextColor,
        title: const Text('BMI Calculator'),
        centerTitle: true, // FIXED: Centers the title
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Gender Row ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                        var bmiValue = calculateBMI(
                          weight: weight,
                          height: height,
                        );

                        setState(() {
                          bmi = bmiValue;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: isMale
                            ? kSelectedTileBorderDecoration
                            : kTileBorderDecoration,

                        child: const Column(
                          children: [
                            Icon(Icons.male, size: 50, color: kActiveTextColor),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 24,
                                color: kActiveTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                        var bmiValue = calculateBMI(
                          weight: weight,
                          height: height,
                        );

                        setState(() {
                          bmi = bmiValue;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: !isMale
                            ? kSelectedTileBorderDecoration
                            : kTileBorderDecoration,

                        child: const Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 50,
                              color: kActiveTextColor,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 24,
                                color: kActiveTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // --- Height Slider Container ---
              Container(
                decoration: kTileBorderDecoration,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(color: kActiveTextColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: kActiveTextColor,
                          ),
                        ),
                        Text("cm", style: TextStyle(color: kActiveTextColor)),
                      ],
                    ),
                    Slider(
                      min: 80,
                      max: 200,
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                        var bmiValue = calculateBMI(
                          weight: weight,
                          height: height,
                        );

                        setState(() {
                          bmi = bmiValue;
                        });
                      },
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: kInactiveTextColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: kTileBorderDecoration,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(color: kActiveTextColor),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                              color: kActiveTextColor,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                backgroundColor: Color.fromARGB(
                                  255,
                                  80,
                                  89,
                                  144,
                                ),
                                mini: true,
                                shape: const CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 25) weight--;
                                  });
                                  var bmiValue = calculateBMI(
                                    weight: weight,
                                    height: height,
                                  );

                                  setState(() {
                                    bmi = bmiValue;
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                elevation: 0,
                                mini: true,
                                backgroundColor: Color.fromARGB(
                                  255,
                                  80,
                                  89,
                                  144,
                                ),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    if (weight < 250) weight++;
                                  });
                                  var bmiValue = calculateBMI(
                                    weight: weight,
                                    height: height,
                                  );

                                  setState(() {
                                    bmi = bmiValue;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Wrap the second Container in Expanded
                  Expanded(
                    child: Container(
                      decoration: kTileBorderDecoration,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(color: kActiveTextColor),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                              color: kActiveTextColor,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                mini: true,
                                backgroundColor: Color.fromARGB(
                                  255,
                                  80,
                                  89,
                                  144,
                                ),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    if (age > 15) age--;
                                  });
                                  var bmiValue = calculateBMI(
                                    weight: weight,
                                    height: height,
                                  );

                                  setState(() {
                                    bmi = bmiValue;
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                elevation: 0,
                                mini: true,
                                backgroundColor: Color.fromARGB(
                                  255,
                                  80,
                                  89,
                                  144,
                                ),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    if (age < 100) age++;
                                  });
                                  var bmiValue = calculateBMI(
                                    weight: weight,
                                    height: height,
                                  );

                                  setState(() {
                                    bmi = bmiValue;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              if (bmi != null)
                Container(
                  decoration: kSelectedTileBorderDecoration,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Your BMI",
                        style: TextStyle(color: kActiveTextColor, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bmi!.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: getBMIColor(bmi!),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 25),

              // --- Bottom Button ---
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFEB1555),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      bmi = calculateBMI(weight: weight, height: height);
                    });
                    var bmiValue = calculateBMI(weight: weight, height: height);

                    setState(() {
                      bmi = bmiValue;
                    });
                  },
                  child: const Text("Calculate BMI"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
