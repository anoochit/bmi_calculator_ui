import 'dart:developer';
import 'package:flutter/material.dart';

import '../widgets/big_button.dart';
import '../widgets/gender_button.dart';
import '../widgets/setvalue_button.dart';
import '../widgets/slider_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator".toUpperCase()),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // select gender
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenderButton(
                    width: (constraints.maxWidth * 0.5) - 8,
                    height: (constraints.maxHeight * 0.3),
                    icon: Icons.male_rounded,
                    iconColor: Colors.cyan.shade300,
                    title: "Male",
                    selected: false,
                    onTab: () {
                      // handle button state in app state
                    },
                  ),
                  GenderButton(
                    width: (constraints.maxWidth * 0.5) - 8,
                    height: (constraints.maxHeight * 0.3),
                    icon: Icons.female_rounded,
                    iconColor: Colors.pink.shade300,
                    title: "Female",
                    selected: false,
                    onTab: () {
                      // handle button state in app state
                    },
                  ),
                ],
              ),

              // height slider
              SliderBox(
                  width: (constraints.maxWidth - 8),
                  height: constraints.maxHeight * 0.3,
                  title: "Height",
                  unit: "cm",
                  sliderActiveColor: Colors.amber,
                  sliderInactiveColor: Colors.amber.shade100,
                  minValue: 100.0,
                  maxValue: 200.0,
                  onChanged: (value) {
                    log('height change value = $value');
                  }),

              // weight and age add buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SetValueButton(
                    width: (constraints.maxWidth * 0.5) - 8,
                    height: (constraints.maxHeight * 0.3),
                    activeColor: Colors.amber,
                    inactiveColor: Colors.white24,
                    title: "Weight",
                    unit: "kg",
                    initValue: 22,
                    onChanged: (value) {
                      log('weight change value = $value');
                    },
                  ),
                  SetValueButton(
                    width: (constraints.maxWidth * 0.5) - 8,
                    height: (constraints.maxHeight * 0.3),
                    activeColor: Colors.amber,
                    inactiveColor: Colors.white24,
                    title: "Age",
                    initValue: 18,
                    onChanged: (value) {
                      log('age change value = $value');
                    },
                  ),
                ],
              ),

              // calculate button
              BigButton(
                width: (constraints.maxWidth) - 8,
                height: (constraints.maxHeight - ((constraints.maxHeight * 0.3) * 3)) - 16,
                text: "calculate",
                onTap: () {
                  log("button tap");
                },
              )
            ],
          );
        },
      ),
    );
  }
}
