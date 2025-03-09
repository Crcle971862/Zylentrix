import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zylentrix/model/dataModel.dart';
import 'package:zylentrix/utils/loaders.dart';

class HomeRepository extends GetxController{
  static HomeRepository get instance=>Get.find();
  final List<DataModel> dataList=[];


  /// Fetching data using api with the help of HTTP
  Future<List<DataModel>> getList() async{
    try{
      final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data=jsonDecode(response.body);
      for(var i in data){
        dataList.add(DataModel.fromJson(i));
      }
      return dataList;
    }
    catch(e){
      ///throw e.toString();
      return Loaders.errorSnackBar(title: "Something went wrong, Please try again");
    }
  }

}