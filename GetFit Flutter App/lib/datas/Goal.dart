class Goal{

  int Id;
  int Amount;
  int UserId;
  String? DateStart;
  int CurrentAmount;
  int Status;


  Goal( this.Id,this.Amount, this.UserId, this.DateStart, this.CurrentAmount, this.Status);

  Goal.fromJson(Map<String, dynamic> json)
      :
        Id = json['_id'],
        Amount = json['amount'],
        UserId = json['userId'],
        DateStart = json['dateStart'],
        CurrentAmount = json['currentAmount'],
        Status = json['status'];

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': Id,
    'Amount': Amount,
    'UserId': UserId,
    'dateStart' : DateStart,
    'currentAmount' : CurrentAmount,
    'status' : Status
  };
}