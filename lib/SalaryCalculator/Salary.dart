class Salary{
  double hourlySalary = 1000;
  double Calculate(int workingDays){
    return(8 * hourlySalary * workingDays);
  }
}