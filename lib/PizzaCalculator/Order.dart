import 'dart:io';

void main()
{
  print("Select Pizza Size : s for Small, m for Medium, L for large");
  String size = stdin.readLineSync()!;
  print("Enter no of pizza: ");
  int qunatity =int.parse(stdin.readLineSync()!);
  int price = getPizzaPrice(size);
  int bill = (qunatity * price);
  print("Your total bill is $bill");
}
getPizzaPrice(String size){
  var priceList = {"s":100,"m":200,"l":300};
  var price = priceList[size];
  return price;
}
