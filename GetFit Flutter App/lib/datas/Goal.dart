class Goal{

  int Id;
  int Amount;
  int UserId;
  int DateStart;
  int CurrentAmount;
  int Status;


  Goal( this.Id,this.Amount, this.UserId, this.DateStart, this.CurrentAmount, this.Status);

  Goal.fromJson(Map<String, dynamic> json)
      :
        Id = json['_id'],
        Amount = json['amount'],
        CurrentAmount = json['currentAmount'],
        DateStart = json['dateStart'],
        UserId = json['userId'],
        Status = json['status'];

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': Id,
    'amount': Amount,
    'currentAmount' : CurrentAmount,
    'dateStart' : DateStart,
    'userId': UserId,
    'status' : Status
  };
}