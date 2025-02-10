void main(){
  int a = 10, b =20;

  if(a > b){
    print("$a büyüktür $b");
  }else{
    print("$b büyüktür $a");
  }

  String day = "Pazartesi";

  switch(day){
    case "Pazartesi":
      print("Hafta başladı!");
      break;
    case "Cuma":
      print("Hafta bitiyor!");
      break;
    default:
      print("Hafta ortası!");
  }
}