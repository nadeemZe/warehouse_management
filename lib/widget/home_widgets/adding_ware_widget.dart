import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_management/constant/helper.dart';
import 'package:warehouse_management/controller/bloc_navigator.dart';
import 'package:warehouse_management/model/ware_model.dart';
import 'package:warehouse_management/widget/adding_ware_widgets/custom_drop_widget.dart';
import 'package:warehouse_management/widget/adding_ware_widgets/custom_textfield.dart';
import '../../reposotory/sqflite_repo.dart';
import 'package:intl/intl.dart';

class AddingWareWidget extends StatefulWidget with NavigationStates {
       AddingWareWidget({Key? key}) : super(key: key);

  @override
  State<AddingWareWidget> createState() => _AddingWareWidgetState();
}

class _AddingWareWidgetState extends State<AddingWareWidget> {

  final TextEditingController _nameController =TextEditingController();
  final TextEditingController _amountController =TextEditingController();
  final TextEditingController _typeController =TextEditingController();
  final TextEditingController _dateController =TextEditingController();
  final TextEditingController _noteController =TextEditingController();

  bool wrongFill=false;

  _pickDate()async{
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
      });
    }
  }

  final SqliteRepo sqliteRepo=SqliteRepo();

  addingWare(){
    if(
     _nameController.text=='' ||
     _amountController.text=='' ||
     _typeController.text=='' ||
     _dateController.text=='' ||
     _noteController.text==''
    ){
      setState(() {
        wrongFill=true;
      });
    }
    else {
      sqliteRepo.addWare(
          WareModel(
            wareName: _nameController.text,
            wareAmount: int.parse(_amountController.text),
            wareType: _typeController.text,
            inOut: CustomDropWidgetState.value,
            wareDate: _dateController.text,
            notes: _noteController.text,
          )
      );
      BlocProvider.of<BlocNavigator>(context)
          .add(WaresWidgetTap());
    }
  }

  @override
  void dispose(){
    _nameController.dispose();
    _amountController.dispose();
    _typeController.dispose();
    _dateController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(21),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                'Ware Card',
                style:headerTextStyle
              ),
              const SizedBox(height: 51,),
              Text(
                'please fill the ware information',
                style: header2TextStyle
              ),
              const SizedBox(height: 17,),
              CustomTextField(
                text: 'Ware Name :',
                controller: _nameController,
                readOnly: false,
              ),
              const SizedBox(height: 7,),
              CustomTextField(
                text: 'Ware Amount :',
                controller: _amountController,
                readOnly: false,
              ),
              const SizedBox(height: 7,),
              CustomTextField(
                text: 'Ware Type :',
                controller: _typeController,
                readOnly: false,
              ),
              const SizedBox(height: 7,),
              const CustomDropWidget(),
              const SizedBox(height: 7,),
              CustomTextField(
                text: 'Ware Date :',
                controller: _dateController,
                readOnly: true,
                onTap: _pickDate
              ),
              const SizedBox(height: 7,),
              CustomTextField(
                text: 'Ware Notes :',
                controller: _noteController,
                readOnly: false,
              ),
              const SizedBox(height: 7,),
              Text(wrongFill
                  ?'please fill all information !'
                  :'',style:const TextStyle(color: Colors.red),),
              const SizedBox(height: 51,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed:(){
                        addingWare();
                      } ,
                      child: const Text('ADD')
                  ),
                  const SizedBox(width: 21,),
                  ElevatedButton(
                      onPressed:(){
                        BlocProvider.of<BlocNavigator>(context)
                            .add(WaresWidgetTap());
                      } ,
                      child: const Text('CANCEL')
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
