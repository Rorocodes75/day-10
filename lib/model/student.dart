class Student {
  int ? id;
  String? name;
  int ? age;
  double ? salary;

  Student({
    this.age,
    this.name,
    this.salary,
    this.id,
  });

  factory Student.fromJson(Map json){
    return Student(
      age: json["age"],
      name: json["name"],
      salary: json["salary"]?.toDouble(),
      id: json["id"],
    );

    
  }
}