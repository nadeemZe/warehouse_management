import 'package:sqflite/sqflite.dart';
import 'package:warehouse_management/model/ware_model.dart';
import 'package:warehouse_management/services/sqflite_init.dart';

class SqliteRepo{

  SQLiteInit sqLiteInit=SQLiteInit.instance;
  static List<WareModel>? waresList;

  Future <List<WareModel>> getWares()async{
     Database? db= await sqLiteInit.db;
     List<Map<String,Object?>>? wares=await db.query('wares');
     waresList= wares.isNotEmpty
       ? wares.map((e) => WareModel.fromMap(e)).toList()
       : [] ;
     return waresList!;
  }

  Future<int> addWare(WareModel wareModel)async{
    Database? db= await sqLiteInit.db;
    return db.insert('wares', wareModel.toMap());
  }

  Future<int> removeWare(int id) async {
    Database db = await sqLiteInit.db;
    return await db.delete('wares', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateWare(WareModel wareModel) async {
    Database db = await sqLiteInit.db;
    return await db.update('wares', wareModel.toMap(),
        where: "id = ?", whereArgs: [wareModel.id]);
  }

}