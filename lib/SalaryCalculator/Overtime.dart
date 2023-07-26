class Overtime{
  double overtimeHourlyRate = 1600;
  double Calculate(double overtimeHours){
    return ( overtimeHourlyRate * overtimeHours);
  }
}