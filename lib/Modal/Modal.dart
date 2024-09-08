class StudentModal
{
  int? id,age;
  String? name;

  StudentModal(this.id, this.age, this.name);
  factory StudentModal.fromMap(Map m1)
  {
    return StudentModal(m1['id'],m1['age'],m1['name']);
  }

}