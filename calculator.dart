

import 'dart:math';

class BMICalculator{
  double weight;
  double height;
  double bmi= 0;
  BMICalculator({required this.weight, required this.height});
  String CalculateBMI()
  {
    bmi = (this.weight/pow(this.height/100, 2));
    return bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(bmi>=25)
      {
        return 'Overwright';
      }
    else if(bmi>18.5)
      {
        return 'Normal';
      }
    else
      {
        return 'Underweight';
      }
  }
  String getAdvice()
  {
    if(bmi>=25)
    {
      return 'You have a higher than normal body weight. Try to exercise more';
    }
    else if(bmi>18.5)
    {
      return 'You have a normal body weight. Good Job!';
    }
    else
    {
      return 'You have a lower than normal body weight. You can eat more.';
    }
  }
}
