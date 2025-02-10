void main(){
  const pi = 3.14;
  final date = DateTime.now();

  print("Pi sabiti: $pi, Tarih: $date");

  //Tür Dönüşümleri

  int age = 25;
  String ageString = age.toString();
  double ageDouble = double.parse("25.5");

  print("Yaş (String): $ageString");
  print("Yaş (Double): $ageDouble");

  String numberofstring = "Boy: ${1.75}";
  print(numberofstring);
}