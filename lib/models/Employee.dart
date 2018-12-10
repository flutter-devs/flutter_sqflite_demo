
class Employee {
  int _id;
  String _name;

  String _designation;
  String _mobile;
  String _bloodGroup;
  String _fatherName;

  set name(String value) {
    _name = value;
  }

  Employee(this._name, this._designation, this._mobile, this._fatherName,
      [this._bloodGroup]);

  Employee.withID(
      this._id, this._name, this._designation, this._mobile, this._fatherName,
      [this._bloodGroup]);

  String get fatherName => _fatherName;

  String get bloodGroup => _bloodGroup;

  String get mobile => _mobile;

  String get designation => _designation;

  String get name => _name;

  int get id => _id;

  set designation(String value) {
    _designation = value;
  }

  set bloodGroup(String value) {
    _bloodGroup = value;
  }

  set fatherName(String value) {
    _fatherName = value;
  }

  set mobile(String value) {
    _mobile = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['employee_id'] = _id;
    }
    map['employee_name'] = _name;
    map['employee_designation'] = _designation;
    map['employee_mobile'] = _mobile;
    map['employee_blood_group'] = _bloodGroup;
    map['employee_father_name'] = _fatherName;
    return map;
  }

  Employee.fromMapObject(Map<String, dynamic> map) {
    this._id = map['employee_id'];
    this._name = map['employee_name'];
    this._designation = map['employee_designation'];
    this._mobile = map['employee_mobile'];
    this._bloodGroup = map['employee_blood_group'];
    this._fatherName = map['employee_father_name'];
  }
}
