import 'package:hive_proj/model-classes/class%20category%20chart%20model.dart';
import 'package:hive_proj/model-classes/class_BankAccount.dart';
import 'package:hive_proj/model-classes/class_Bank_Transaction.dart';
import 'package:hive_proj/model-classes/class_Person.dart';
import 'package:hive_proj/model-classes/class_catagory.dart';
import 'package:hive_proj/model-classes/class_coin_account.dart';
import 'package:hive_proj/model-classes/class_coin_transaction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DBHandler {

  var tbl_bank_account = 'BankAccount' ;
  var tbl_coin_account = 'CoinAccount' ;
  var tbl_person = 'Person' ;
  var tbl_category = 'Catagory' ;
  var tbl_bank_transaction = 'Bank_Transaction' ;
  var tbl_coin_transaction = 'Coin_transaction' ;

  Future<Database> initDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path,'BankAccount.db'),
      onCreate: (database,version) async{

        await database.execute("CREATE TABLE $tbl_bank_account(bank_name TEXT PRIMARY KEY NOT NULL,"
            "mojodi REAL NOT NULL,bankaccountnumber TEXT NOT NULL)"
        );

        await database.execute("CREATE TABLE $tbl_coin_account(CoinAddress TEXT PRIMARY KEY,"
            "Mojodi REAL NOT NULL,CoinName TEXT NOT NULL)"
        );

        await database.execute("CREATE TABLE $tbl_person(Name TEXT PRIMARY KEY,"
            "Daryaft_kol REAL NOT NULL)"
        );

        await database.execute("CREATE TABLE $tbl_category(Cat_Name TEXT PRIMARY KEY)"
        );


            await database.execute("CREATE TABLE $tbl_bank_transaction(bank_transaction_id INTEGER PRIMARY KEY "
            "AUTOINCREMENT,"
            "date TEXT NOT NULL,mablagh REAL NOT NULL,"
            "tra_bank_acc_name TEXT NOT NULL,"
            "tra_person_name_bank TEXT NOT NULL,"
            "tra_category_name TEXT NOT NULL,"
            "FOREIGN KEY (tra_category_name) REFERENCES $tbl_category (Cat_Name),"
            "FOREIGN KEY (tra_person_name_bank) REFERENCES $tbl_person (Name),"
            "FOREIGN KEY (tra_bank_acc_name) REFERENCES $tbl_bank_account (bank_name))"

        );

        await database.execute("CREATE TABLE $tbl_coin_transaction(coin_transaction_id INTEGER PRIMARY KEY "
            "AUTOINCREMENT,"
            "date TEXT NOT NULL,mablagh_transaction_coin REAL NOT NULL,"
            "tra_coin_address TEXT NOT NULL,"
            "tra_name_coin TEXT NOT NULL,"
            "coin_category_name TEXT NOT NULL,"
            "FOREIGN KEY (coin_category_name) REFERENCES $tbl_category (Cat_Name),"
            "FOREIGN KEY (tra_name_coin) REFERENCES $tbl_person(Name),"
            "FOREIGN KEY (tra_coin_address) REFERENCES $tbl_bank_account(CoinAddress))"
        );

      }, version: 1
    );
  }

  //insert

  Future<int> insertBankAccount(BankAccount bankaccount) async{
    final Database db = await initDB();
    var result = await db.insert(tbl_bank_account, bankaccount.toMap());
    return result;
  }

  Future<int> insertCoinAccount(CoinAccount coinaccount) async{
    final Database db = await initDB();
    var result = await db.insert(tbl_coin_account, coinaccount.toMap());
    return result;
  }

  Future<int> insertPerson(Person person) async{
    final Database db = await initDB();
    var result = await db.insert(tbl_person , person.toMap());
    return result;
  }

  Future<int> insertCatagory( Catagory_mycat catagory) async{
    final Database db = await initDB();
    var result = await db.insert(tbl_category, catagory.toMap());
    return result;
  }

  Future<int> insertBankTransaction(Bank_Transaction bank_transaction) async{
    final Database db = await initDB();
    var result = await db.insert(tbl_bank_transaction, bank_transaction.toMap());
    return result;
  }

  Future<int> insertCoinTransaction(Coin_transaction coin_transaction) async{
    final Database db = await initDB();
    var result = await db.insert(tbl_coin_transaction, coin_transaction.toMap());
    return result;
  }





  //read




  Future<List<BankAccount>> get_BankAccount_List() async{
    final Database db = await initDB();
    final List<Map<String , Object?>> result = await db.query(tbl_bank_account);
    var mylist = result.map((e) => BankAccount.fromMap(e)).toList();
    return mylist;
  }

  Future<List<CoinAccount>> get_CoinAccount_List() async{
    final Database db = await initDB();
    final List<Map<String , Object?>> result = await db.query(tbl_coin_account);
    var mylist = result.map((e) => CoinAccount.fromMap(e)).toList();
    return mylist;
  }

  Future<List<Person>> get_Person_List() async{
    final Database db = await initDB();
    final List<Map<String , Object?>> result = await db.query(tbl_person);
    var mylist = result.map((e) => Person.fromMap(e)).toList();
    return mylist;
  }

  Future<List< Catagory_mycat>> get_Catagory_List() async{
    final Database db = await initDB();
    final List<Map<String , Object?>> result = await db.query(tbl_category);
    var mylist = result.map((e) =>  Catagory_mycat.fromMap(e)).toList();
    return mylist;
  }

  Future<List<Bank_Transaction>> get_Bank_Transaction_List() async{
    final Database db = await initDB();
    final List<Map<String , Object?>> result = await db.query(tbl_bank_transaction);
    var mylist = result.map((e) => Bank_Transaction.fromMap(e)).toList();
    return mylist;
  }

  Future<List<Coin_transaction>> get_Coin_transaction_List() async{
    final Database db = await initDB();
    final List<Map<String , Object?>> result = await db.query(tbl_coin_transaction);
    var mylist = result.map((e) => Coin_transaction.fromMap(e)).toList();
    return mylist;
  }

  Future<List<cat_model_chart>> get_cat_model_chart_list() async{
    final Database db = await initDB();
    final List<Map<String , Object?>> result = await db.query(tbl_bank_transaction,
      columns: ["tra_category_name","mablagh"]
    );

    // rawQuery(
    //     "SELECT tra_category_name,SUM(mablagh) FROM $tbl_bank_transaction "
    //         "GROUP BY tra_category_name"
    // );
    var mylist = result.map((e) => cat_model_chart.fromMap(e)).toList();

    return mylist ;
  }





  //Update


  Future<int> Update_BankAccount(BankAccount bankAccount) async{
    final Database db = await initDB();
    var result = await db.update(tbl_bank_account, bankAccount.toMap());
    return result ;
  }









  //Delete


  Future<void> Delete_BankAccount(String bankaccnumber) async {
    final Database db = await initDB();
    var res = await  db.delete(
      tbl_bank_account,
      where: 'bankaccnumber = ?',whereArgs: [bankaccnumber]
    );
  }




 //Search

Future<List<BankAccount>> search_BankAccount(var name)async{
    final Database db = await initDB();
    final List<Map<String,Object?>> res = await db.query(
      tbl_bank_account,
      where: 'bank_name LIKE ?' , whereArgs: [name]
    );
    var mylist = res.map((e) => BankAccount.fromMap(e)).toList();
    return mylist;
}

}

