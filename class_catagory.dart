




class Catagory_mycat {

  String Cat_Name ='';


  Catagory_mycat(this.Cat_Name);

  Catagory_mycat.fromMap(Map<String, dynamic> res) :
        Cat_Name = res["Cat_Name"];

  Map<String,Object?> toMap(){
    return {'Cat_Name' : Cat_Name };
  }
  

}

