


class Person {

  String Name = '';
  double Daryaft_kol = 0;

  Person(this.Name, this.Daryaft_kol);

  Person.fromMap(Map<String, dynamic> res) :
        Name = res["Name"],
        Daryaft_kol = res["Daryaft_kol"];

  Map<String,Object?> toMap(){
    return {'Name' :Name , "Daryaft_kol" : Daryaft_kol};
  }

  double Add_to_daryaft_kol(double x) {
    Daryaft_kol = Daryaft_kol + x;
    return Daryaft_kol;
  }

  double Kasr_az_daryaft_kol(double x) {
    Daryaft_kol = Daryaft_kol - x;
    return Daryaft_kol;
  }
}
