
class CoinAccount {

  String CoinName = '';
  String CoinAddress = '';
  double Mojodi = 0;

  CoinAccount(this.CoinAddress, this.CoinName ,this.Mojodi);

  CoinAccount.fromMap(Map<String, dynamic> res) :
        CoinName = res["CoinName"],
        CoinAddress = res["CoinAddress"],
        Mojodi = res["Mojodi"];

  Map<String,Object?> toMap(){
    return {'CoinName' : CoinName , "CoinAddress" : CoinAddress , "Mojodi" : Mojodi};
  }

  double Bardasht(double x) {
    Mojodi = Mojodi - x;
    return Mojodi;
  }

  double Variz(double x) {
    Mojodi = Mojodi + x;
    return Mojodi;
  }
}

