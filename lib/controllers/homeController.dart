import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:zylentrix/model/dataModel.dart';
import 'package:zylentrix/repository/homeRepository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:zylentrix/utils/loaders.dart';
class HomeController extends GetxController{
  static HomeController get instance=>Get.find();
  HomeRepository homeRepository=Get.put(HomeRepository());

  RxList<DataModel> dataList=<DataModel>[].obs;
  final isLoading=false.obs;

  @override
  onInit(){
    getAllData();
    super.onInit();
  }

  /// getting all data and saving it in list
  Future<void> getAllData() async{
    try{
      isLoading.value=true;
      await Future.delayed(Duration(seconds: 3));
      final data=await homeRepository.getList();
      for(var i in data){
        dataList.add(i);
        print(i.id);
      }

    }
    catch(e){
      //throw e.toString();
      Loaders.errorSnackBar(title: "Something went wrong,Please try again");
    }
    finally{
      isLoading.value=false;
    }
  }

  /// function to remove line seprator
  String remove(String data){
    return data.replaceAll("\n","");
  }

}