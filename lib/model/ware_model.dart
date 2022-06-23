

class WareModel {
  int? id;
  String? wareName;
  int? wareAmount;
  String? inOut;
  String? wareType;
  String? wareDate;
  String? notes;

  WareModel({
    this.id,
    this.wareName,
    this.wareAmount,
    this.inOut,
    this.wareType,
    this.wareDate,
    this.notes
  });

  //singleton in dart by using factory
 factory WareModel.fromMap(Map<String, dynamic> json) =>  WareModel(
    id: json['id'],
    wareName: json['wareName'],
    wareAmount: json['wareAmount'],
    inOut: json['inOut'],
    wareType: json['wareType'],
    wareDate: json['wareDate'],
    notes: json['notes']
  );

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'wareName': wareName,
      'wareAmount': wareAmount,
      'inOut':inOut,
      'wareType': wareType,
      'wareDate':wareDate,
      'notes':notes
    };
  }

}






