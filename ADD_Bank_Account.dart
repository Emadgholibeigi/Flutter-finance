import 'package:flutter/material.dart';
import 'package:hive_proj/Database/DBHandler.dart';
import 'package:hive_proj/model-classes/class_BankAccount.dart';

class Add_Bank_Account extends StatefulWidget {
  const Add_Bank_Account({Key? key}) : super(key: key);

  @override
  State<Add_Bank_Account> createState() => _Add_Bank_AccountState();
}

class _Add_Bank_AccountState extends State<Add_Bank_Account> {

  final Bank_name_controller = TextEditingController();
  final Bank_number_controller = TextEditingController();
  final Bank_mojodi_controller = TextEditingController();
  late  DBHandler handler;

  @override
  void initState() {

    handler = DBHandler();
    handler.initDB().whenComplete(() => print("Database opened in add account bank."));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //toolbarHeight: 100,
        centerTitle: true,
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_outlined)),
                const SizedBox(
                  width: 90,
                ),
                const Text("Add Bank Account"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(254, 254, 216, 1),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 10,
            ),
            ////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  height: 80,
                  child: Row(
                    children: [
                      const Icon(Icons.museum_rounded),
                      const SizedBox(
                        width: 80,
                      ),
                      Container(
                        width: 170,
                        child: TextField(
                          controller: Bank_name_controller,
                          maxLength: 12,
                          decoration: const InputDecoration(

                              hintText: 'Bank Name'
                          ),

                        ),
                      ),

                    ],
                  )
              ),
            ),
            //////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  height: 80,
                  child: Row(
                    children: [
                      const Icon(Icons.credit_card_outlined),
                      const SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 190,
                        child: TextField(
                          controller: Bank_number_controller,
                          keyboardType: TextInputType.number,
                          maxLength: 20,
                          decoration: const InputDecoration(
                              hintText: 'Bank Account Number'
                          ),

                        ),
                      ),

                    ],
                  )
              ),
            ),
            ////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  height: 80,
                  child: Row(
                    children: [
                      const Icon(Icons.attach_money_rounded),
                      const SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 190,
                        child: TextField(
                          controller: Bank_mojodi_controller,
                          keyboardType: TextInputType.number,
                          maxLength: 20,
                          decoration: const InputDecoration(
                              hintText: 'mojodi'
                          ),

                        ),
                      ),

                    ],
                  )
              ),
            ),
            ////////////////////////////////////////////////////////////////////
            Container(

              width: 200,
              height: 70,
              child: ElevatedButton(

                onPressed: (){
                setState(() {
                  var a = Bank_number_controller;
                  var b = Bank_name_controller;
                  var c = Bank_mojodi_controller;
                  try {
                    BankAccount bankaccount =
                    BankAccount( double.parse( c.text.toString()),bankaccountnumber:  a.text.toString(),bank_name: b.text.toString());


                    handler.insertBankAccount(bankaccount);
                    Navigator.pop(context,true);
                  }
                  catch(e){
                    print('nashod*************************');
                  }
                });
                },
                child: const Text('save',style: TextStyle(fontSize: 35),),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
