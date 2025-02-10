void main(){

  String? name = "Ahmet";
  print(name ?? "Varsayılan Değer");

  if(name != null){
    print("İsim uzunluğu: ${name.length}");
  }
}
