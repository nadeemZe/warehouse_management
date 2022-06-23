import 'package:flutter/material.dart';
import 'package:warehouse_management/controller/bloc_navigator.dart';
import 'package:warehouse_management/view/ware_edit.dart';
import 'package:warehouse_management/view/ware_inventory.dart';
import '../../constant/helper.dart';
import '../../model/ware_model.dart';
import '../../reposotory/sqflite_repo.dart';

class WaresWidget extends StatefulWidget with NavigationStates{
   WaresWidget({Key? key}) : super(key: key);

  @override
  State<WaresWidget> createState() => _WaresWidgetState();
}

class _WaresWidgetState extends State<WaresWidget> {
  final SqliteRepo sqliteRepo=SqliteRepo();

   void showMyDialog(context,WareModel wareModel) {
     showDialog(
       context:context,
       builder: (BuildContext c) {
         return AlertDialog(
           backgroundColor: Colors.indigo,
           contentPadding:const EdgeInsets.all(25),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
           content: SizedBox(
               height:151,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   GestureDetector(
                     onTap: ()async{
                       Navigator.of(c).pop();
                       Navigator.push(context,
                           MaterialPageRoute(
                               builder:(context)=>WareCardMonthlyWidget(name: wareModel.wareName,)));
                     },
                     child: Row(
                       children: const[
                          Icon(Icons.inventory,color: Colors.white,),
                          SizedBox(width: 10,),
                         Text('INVENTORY',
                           style:  TextStyle(
                             color: Colors.white,
                           ),)
                       ],
                     ),
                   ),
                   const Divider(color: Colors.white,),
                   GestureDetector(
                     onTap: ()async{
                       Navigator.of(c).pop();
                       Navigator.push(context,
                        MaterialPageRoute(
                               builder:(context)=>EditWare(wareModel: wareModel)));
                     },
                     child: Row(
                       children: const [
                         Icon(Icons.edit,color: Colors.white,),
                         SizedBox(width: 10,),
                         Text('EDIT',
                           style: TextStyle(
                             color: Colors.white,
                           ),)
                       ],
                     ),
                   ),
                   const Divider(color: Colors.white,),
                   GestureDetector(
                     onTap: ()async{
                       sqliteRepo.removeWare(wareModel.id!);
                       Navigator.of(c).pop();
                       setState(() {});
                     },
                     child: Row(
                       children: const [
                         Icon(Icons.delete,color: Colors.white,),
                         SizedBox(width: 10,),
                         Text('DELETE',
                           style: TextStyle(
                             color: Colors.white,
                           ),)
                       ],
                     ),
                   ),
                 ],
               )
           ),
         );
       },
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<WareModel>>(
          future: sqliteRepo.getWares(),
          builder: (context,AsyncSnapshot<List<WareModel>>snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if(snapshot.hasData) {
              List<WareModel> wares=snapshot.data!;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text(
                          'Wares Table',
                          style: headerTextStyle,
                      ),
                      const SizedBox(height: 51,),
                      Text(
                        'Table of wares in Warehouse ',
                        style: header2TextStyle
                      ),
                      const SizedBox(height: 17,),
                      DataTable(
                        border: TableBorder.all(),
                        dividerThickness: 5,
                        headingRowHeight: 99,
                        columns:  [
                          DataColumn(label: Text('id',style: columnTextStyle,)),
                          DataColumn(label: Text('Ware Name',style: columnTextStyle,)),
                          DataColumn(label: Text('Ware Amount',style: columnTextStyle,)),
                          DataColumn(label: Text('Ware Type',style: columnTextStyle,)),
                          DataColumn(label: Text('In/Out',style: columnTextStyle,)),
                          DataColumn(label: Text('Ware Date',style: columnTextStyle,)),
                          DataColumn(label: Text('Notes',style: columnTextStyle,)),
                        ],
                        rows: wares.map<DataRow>((e) =>
                            DataRow(cells: [
                              DataCell(Text(e.id.toString()),),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed:() {
                                          showMyDialog(context,e);
                                        },
                                        icon:const Icon( Icons.settings)),
                                    Text(e.wareName!),
                                  ],
                                ),
                              ),
                              DataCell(Text(e.wareAmount.toString())),
                              DataCell(Text(e.wareType!)),
                              DataCell(Text(e.inOut!)),
                              DataCell(Text(e.wareDate!)),
                              DataCell(Text(e.notes!)),
                            ],

                            )).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Text('List is empty');
          }
      ),
    );
  }
}