void main(){
  int age = 38;
  double size = 1.75;
  String name = "Ahmet";

  var city = "Mersin";
  city = "Adana";

  print("Ad: $name, Yaş: $age, Boy: $size, Şehir: $city");

  dynamic dynamicValue = "Merhaba";
  print(dynamicValue);
  dynamicValue = 123;
  print(dynamicValue);
}