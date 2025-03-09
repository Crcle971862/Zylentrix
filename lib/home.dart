import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zylentrix/controllers/homeController.dart';
import 'package:zylentrix/model/dataModel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Post',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [Image(image: AssetImage('assets/tick.png'),height: 40,width: 40,),SizedBox(width: 20,)],
      ),
      body: Obx(
        ()=>controller.isLoading==true?Center(
          child: Container(alignment: Alignment.center,
              height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 1.0),
                  color: Colors.grey,
                  blurRadius: 6
                )
              ]
            ),
            child: Image.asset('assets/Animation.gif')
          )

        )
            : ListView.separated(
          separatorBuilder:(_,int)=>SizedBox(),
          itemCount: controller.dataList.length,
          itemBuilder:(context,index){
            DataModel dataModel=controller.dataList[index];
            return Container(
              margin: EdgeInsets.all(10),
              ///height: Get.height*0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3
                    )
                  ]
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(

                      dataModel.title.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      controller.remove(dataModel.body),

                    )
                  ],
                ),
              ),
            );
          }

        ),
      ),
    );
  }
}
