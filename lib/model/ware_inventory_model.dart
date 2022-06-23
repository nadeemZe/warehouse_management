import 'package:warehouse_management/model/ware_model.dart';
import 'package:warehouse_management/reposotory/sqflite_repo.dart';

class WareInventoryModel{

  List? list= SqliteRepo.waresList;
  List<WareModel>wareList=[];

  getWareInventoryList(String name){
    int? listLength=list?.length;
    for(int i=0;i<listLength!;i++){
      if(list?[i].wareName==name){
       wareList.add(list?[i]);
      }
    }
    return wareList;
  }

   getWareInventory(){
    int amount =0;
    int? listLength=wareList.length;
   for(int i=0;i<listLength;i++){
     if(wareList[i].inOut=='In'){
       amount = amount + wareList[i].wareAmount!;
     }
     if(wareList[i].inOut=='Out'){
       amount = amount - wareList[i].wareAmount!;
     }
   }
   return amount;
  }

}