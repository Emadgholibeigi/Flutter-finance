


class BankAccount {

  String? bank_name = '' ;
  String? bankaccountnumber = '' ;
  double mojodi = 0;

  BankAccount( this.mojodi,{this.bankaccountnumber ,this.bank_name });

  BankAccount.fromMap(Map<String, dynamic> res) :
        bank_name = res["bank_name"],
        bankaccountnumber = res["bankaccountnumber"],
        mojodi = res["mojodi"];

  Map<String,Object?> toMap(){
    return {'bank_name' :  bank_name ,
      "bankaccountnumber" : bankaccountnumber ,
      "mojodi" : mojodi};
  }

  double Bardasht(double x) {
    mojodi = mojodi - x;
    return mojodi;
  }

  double Variz(double x) {
    mojodi = mojodi + x;
    return mojodi;
  }
}
