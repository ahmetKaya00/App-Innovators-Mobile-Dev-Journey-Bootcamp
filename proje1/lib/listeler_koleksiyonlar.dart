void main(){
  List<String> names = ["Ahmet","Ali","Ayşe"];
  names.add("Fatma");
  print(names);

  var uzunIsimler = names.where((isim) => isim.length > 4).toList();
  print("Uzun isimler: $uzunIsimler");

  Map<String, int> yaslar = {"Ali": 25, "Ayşe":22};
  yaslar["Mehmnet"] = 30;
  print(yaslar);

  var benzersizSet =  <int>{1,2,3,4,4,3};
  print(benzersizSet);
}