


class Bank_Transaction {
  double? mablagh = 0.0  ;
  int? bank_transaction_id;
  String? date ;
  String? tra_bank_acc_name ;
  String? tra_person_name_bank ;
  String? tra_category_name ;

  Bank_Transaction({this.bank_transaction_id,this.date ,
    this.tra_bank_acc_name ,this.tra_category_name ,
    this.tra_person_name_bank , this.mablagh});

  Bank_Transaction.fromMap(Map<String, dynamic> res) :
        bank_transaction_id = res["bank_transaction_id"],
        date = res["date"],
        tra_person_name_bank = res["tra_person_name_bank"],
        tra_bank_acc_name = res["tra_bank_acc_name"],
        tra_category_name = res["tra_category_name"],
        mablagh = res["mablagh"];

  Map<String,Object?> toMap(){
    return {'bank_transaction_id' : bank_transaction_id ,
      "date" : date , "tra_person_name_bank" : tra_person_name_bank ,
    "tra_bank_acc_name" : tra_bank_acc_name ,
      'tra_category_name' : tra_category_name , "mablagh" : mablagh};
  }

}
