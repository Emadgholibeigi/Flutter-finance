



class Coin_transaction {
  double mablagh = 0.0 ;
  int? coin_transaction_id = 0;
  String date = '';
  String tra_coin_address = '';
  String tra_name_coin = '';
  String coin_category_name = '';

  Coin_transaction(this.coin_transaction_id, this.date ,this.tra_coin_address ,this.coin_category_name , this.tra_name_coin ,this.mablagh);

  Coin_transaction.fromMap(Map<String, dynamic> res) :
        coin_transaction_id = res["coin_transaction_id"],
        date = res["date"],
        tra_name_coin = res["tra_name_coin"],
        tra_coin_address = res["tra_coin_address"],
        coin_category_name = res["coin_category_name"],
        mablagh = res["mablagh"];


  Map<String,Object?> toMap(){
    return {'coin_transaction_id' : coin_transaction_id , "date" : date , "tra_name_coin" : tra_name_coin ,
      "tra_coin_address" : tra_coin_address ,'coin_category_name' : coin_category_name , "mablagh" : mablagh };
  }

}
