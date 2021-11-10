class Sport{
  int Id;
  String Type;
  double Kcal;

  Sport( this.Id, this.Type, this.Kcal);

  Sport.fromJson(Map<String, dynamic> json)
      :
        Id = json['_id'],
        Type = json['type'],
        Kcal = json['kcal'];

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': Id,
    'type': Type,
    'kcal' : Kcal
  };
}