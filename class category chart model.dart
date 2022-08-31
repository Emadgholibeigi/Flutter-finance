


class cat_model_chart {

  var tra_category_name;
  var mablagh;

  cat_model_chart({this.mablagh,this.tra_category_name});

  cat_model_chart.fromMap(Map<String, dynamic> res) :
        tra_category_name = res["tra_category_name"],
        mablagh = res["mablagh"];

  Map<String,Object?> toMap(){
    return {
      "tra_category_name" : tra_category_name ,
      "mablagh" : mablagh};
  }


}