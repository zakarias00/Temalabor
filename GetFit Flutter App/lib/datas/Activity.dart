
class Activity{
    int Id;
    int SportId;
    int UserId;
    double? Time;
    String? Date;
    double? Kcal;
    double Distance;

    Activity( this.Id, this.SportId, this.UserId,this.Time, this.Date,this.Kcal,this.Distance);

    Activity.fromJson(Map<String, dynamic> json)
        :
            Id = json['_id'],
            Time = json['time'],
            Date = json['date'],
            UserId = json['userId'],
            SportId = json['sportId'],
            Kcal = json['kcal'],
            Distance = json['distance'];

    Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': Id,
        'sportId': SportId,
        'userId': UserId,
        'time' : Time,
        'date' : Date,
        'kcal' : Kcal,
        'distance': Distance
    };

}



