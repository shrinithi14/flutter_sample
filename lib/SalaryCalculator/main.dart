import 'package:flutter_sample/SalaryCalculator/Tax.dart';

import 'Salary.dart';
import 'Overtime.dart';
import 'dart:io';

void main(){
  var salary = new Salary();
  var overtime = new Overtime();
  var tax = new Tax();

  print("Enter number of working days");
  int workingDays = int.parse(stdin.readLineSync()!);
  print("Enter total overtime hours");
  double overtimeHours =double.parse(stdin.readLineSync()!);

  double totalSalary = salary.Calculate(workingDays);
  double totalOvertimeCharges = overtime.Calculate(overtimeHours);
  double total = totalOvertimeCharges + totalSalary;
  double salaryAfterTax = tax.Calculate(total);

  print("Salary : $totalSalary");
  print("Overtime charges : $totalOvertimeCharges");
  print("Total : $total");
  print("Salary after Tax Deduction : $salaryAfterTax");
}