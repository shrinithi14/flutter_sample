class Tax{
  double taxPercentage = 0.02;
  double taxSlab = 100000;
  double Calculate(double salary) {
    if (salary > taxSlab) {
      double salaryAfterTax = salary - (salary * taxPercentage);
      return salaryAfterTax;
    }
  return salary;
  }
}