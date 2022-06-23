import 'package:flutter/material.dart';
import 'package:warehouse_management/constant/helper.dart';
import 'package:warehouse_management/controller/bloc_navigator.dart';
import 'package:warehouse_management/model/ware_model.dart';
import 'package:warehouse_management/widget/adding_ware_widgets/custom_drop_widget.dart';
import 'package:warehouse_management/widget/adding_ware_widgets/custom_textfield.dart';
import '../../reposotory/sqflite_repo.dart';
import 'package:intl/intl.dart';
import 'home.dart';

class EditWare extends StatefulWidget with NavigationStates {
  final WareModel wareModel;
  EditWare({Key? key,required this.wareModel}) : super(key: key);

  @override
  State<EditWare> createState() => _EditWareState();
}

class _EditWareState extends State<EditWare> {

  final TextEditingController _nameController =TextEditingController();
  final TextEditingController _amountController =TextEditingController();
  final TextEditingController _typeController =TextEditingController();
  final TextEditingController _dateController =TextEditingController();
  final TextEditingController _noteController =TextEditingController();

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

  editWare(){
    sqliteRepo.updateWare(
        WareModel(
          id: widget.wareModel.id,
          wareName: (_nameController.text =='')?widget.wareModel.wareName:_nameController.text,
          wareAmount: (_amountController.text == '')? widget.wareModel.wareAmount:int.parse(_amountController.text),
          wareType: (_typeController.text =='')?widget.wareModel.wareType:_typeController.text,
          inOut: CustomDropWidgetState.value,
          wareDate: (_dateController.text =='')? widget.wareModel.wareDate:_dateController.text,
          notes: (_noteController.text == '')?widget.wareModel.notes:_noteController.text,
        )
    );
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const MyHomePage()));
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
                  'Ware Edit',
                  style:headerTextStyle
              ),
              const SizedBox(height: 51,),
              Text(
                  'Edit ware information by replacing the value',
                  style: header2TextStyle
              ),
              const SizedBox(height: 17,),
              CustomTextField(
                text: 'Ware Name : ',
                hintText: widget.wareModel.wareName,
                controller: _nameController,
                readOnly: false,
              ),
              const SizedBox(height: 7,),
              CustomTextField(
                text: 'Ware Amount : ',
                hintText: widget.wareModel.wareAmount.toString(),
                controller: _amountController,
                readOnly: false,
              ),
              const SizedBox(height: 7,),
              CustomTextField(
                text: 'Ware Type : ',
                hintText: widget.wareModel.wareType,
                controller: _typeController,
                readOnly: false,
              ),
              const SizedBox(height: 7,),
              CustomDropWidget(value: widget.wareModel.inOut,),
              const SizedBox(height: 7,),
              CustomTextField(
                  text: 'Ware Date : ',
                  hintText: widget.wareModel.wareDate,
                  controller: _dateController,
                  readOnly: true,
                  onTap: _pickDate
              ),
              const SizedBox(height: 7,),
              CustomTextField(
                text: 'Ware Notes : ',
                hintText: widget.wareModel.notes,
                controller: _noteController,
                readOnly: false,
              ),
              const SizedBox(height: 51,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed:(){
                        editWare();
                      } ,
                      child: const Text('EDIT')
                  ),
                  const SizedBox(width: 21,),
                  ElevatedButton(
                      onPressed:(){
                        Navigator.pop(context);
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
