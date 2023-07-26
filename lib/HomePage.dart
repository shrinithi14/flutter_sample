import 'Utility/Calculcations.dart';

void main(){
  pageLoad();
}
void pageLoad(){
  int result = Sum(90, 1);
  var data = getData();
  data.then((value){
    print(value);
  });
  print("Result is $result");
}
getData() {
  return Future.delayed(Duration(seconds: 3), () {
     return {1,4};
  });
}