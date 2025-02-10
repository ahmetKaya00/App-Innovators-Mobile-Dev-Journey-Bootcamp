class Car{
  String marka;
  int yil;

  Car(this.marka, this.yil);

  void bilgiGoster(){
    print("Marka: $marka, Yıl: $yil");
  }
}

void main(){
  var araba = Car("Toyota", 2020);
  araba.bilgiGoster();
  var araba2 = Car("Toyota", 2020);
  araba2.bilgiGoster();
}
