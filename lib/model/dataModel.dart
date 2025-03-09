class DataModel{
  int userId,id;
  String title,body;

  ///------------Constructor for data-----------------------

  DataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  });

  static DataModel empty()=>DataModel(userId: 0, id: 0, title: '', body: '');


  factory DataModel.fromJson(Map<String,dynamic>data){
    if(data.isNotEmpty){
      return DataModel(
          userId: data["userId"],
          id: data["id"],
          title: data["title"],
          body: data["body"]
      );
    }
    else{
      return DataModel.empty();
    }
  }
}