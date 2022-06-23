import 'package:flutter/material.dart';
import 'package:warehouse_management/constant/helper.dart';
import 'package:warehouse_management/controller/bloc_navigator.dart';
import 'package:warehouse_management/model/ware_inventory_model.dart';
import 'package:warehouse_management/model/ware_model.dart';

class WareCardMonthlyWidget extends StatefulWidget with NavigationStates{

  final String? name;

  const WareCardMonthlyWidget({Key? key,this.name}) : super(key: key);

  @override
  State<WareCardMonthlyWidget> createState() => _WareCardMonthlyWidgetState();
}

class _WareCardMonthlyWidgetState extends State<WareCardMonthlyWidget> {

  final WareInventoryModel _wareInventoryModel=WareInventoryModel();
  List<WareModel> wares=[];
  int? amount;

  getWare(){
     wares=_wareInventoryModel.getWareInventoryList(widget.name!);
     amount=_wareInventoryModel.getWareInventory();
  }

  @override
  void initState() {
    super.initState();
    getWare();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(21),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Ware Inventory',
                style: headerTextStyle,
              ),
              const SizedBox(height: 51,),
              const Text(
                'Ware movement throw last month',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 21
                ),
              ),
              const SizedBox(height: 17,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Ware Name : ',
                  ),
                  Text(
                    wares[0].wareName!,
                    style: columnTextStyle,
                  ),
                  const Text('  /   Ware current amount : ',
                  ),
                  Text(
                    amount.toString(),
                    style: columnTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 7,),
              DataTable(
                border: TableBorder.all(),
                dividerThickness: 5,
                headingRowHeight: 99,
                columns:  [
                  DataColumn(label: Text('Ware Amount',style: columnTextStyle,)),
                  DataColumn(label: Text('Ware Type',style: columnTextStyle,)),
                  DataColumn(label: Text('In/Out',style: columnTextStyle,)),
                  DataColumn(label: Text('Ware Date',style: columnTextStyle,)),
                ],
                rows: wares.map<DataRow>((e) =>
                    DataRow(cells: [
                      DataCell(Text(e.wareAmount.toString()),),
                      DataCell(Text(e.wareType!),),
                      DataCell(Text(e.inOut!),),
                      DataCell(Text(e.wareDate!)),
                    ],
                    )).toList(),
              ),
              const SizedBox(height: 51,),
              ElevatedButton(
                  onPressed:(){
                    Navigator.pop(context);
                  } ,
                  child: const Text('BACK')
              )
            ],
          ),
        ),
      )
    );
  }
}