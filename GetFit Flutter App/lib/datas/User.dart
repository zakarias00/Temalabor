class User{
  int Id;
  String Username;
  String Name;
  String Email;
  String Password;
  int Points;
  int Level;
  String? Birthdate;
  double Height;
  double Weight;
  bool Gender;

  User( this.Id, this.Username, this.Name, this.Email, this.Password, this.Points, this.Level, this.Birthdate,
      this.Height, this.Weight, this.Gender);

  User.fromJson(Map<String, dynamic> json)
      :
        Id= json['_id'],
        Username = json['username'],
        Name = json['name'],
        Email = json['email'],
        Password = json['password'],
        Points = json['points'],
        Level = json['level'],
        Birthdate = json['birthdate'],
        Height = json['height'],
        Weight = json['weight'],
        Gender = json['gender'];

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': Id,
    'username': Username,
    'name': Name,
    'email' : Email,
    'password' : Password,
    'points' : Points,
    'level' : Level,
    'birthdate' : Birthdate,
    'height' : Height,
    'weight' : Weight,
    'gender' : Gender
  };
}

