import 'package:flutter_database_demo/models/Employee.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  static DataBaseHelper _databaseHelper;
  static Database _database;
  String tableName = 'employee_table';
  String name = 'employee_name';
  String id = 'employee_id';
  String designation = 'employee_designation';
  String mobile = 'employee_mobile';
  String bloodGroup = 'employee_blood_group';
  String fatherName = 'employee_father_name';

  DataBaseHelper._creatInstance();

  factory DataBaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DataBaseHelper._creatInstance();
    }

    return _databaseHelper;
  }



  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'employee.db';
    var employeeDatabase =
        await openDatabase(path, version: 1, onCreate: _creatDB);
    return employeeDatabase;
  }

  void _creatDB(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, $designation TEXT, $mobile TEXT, $bloodGroup TEXT, $fatherName TEXT)');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<List<Map<String, dynamic>>> getEmployeeMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $tableName order by $id ASC');
    //var result = await db.query(tableName, orderBy: '$id ASC');
    return result;
  }

  // Insert

  Future<int> insertEmployee(Employee employee) async {
    Database db = await this.database;

    var result = await db.insert(tableName, employee.toMap());
    return result;
  }

  // Update

  Future<int> updateEmployee(Employee employee) async {
    Database db = await this.database;
    var result = await db.update(tableName, employee.toMap(),
        where: '$id = ?', whereArgs: [employee.id]);
    return result;
  }

  // Delete

  Future<int> deleteEmployee(int id1) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $tableName WHERE $id = $id1');
    return result;
  }

  //Total Count

  Future<int> getCount() async {
    var db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Employee>> getEmployeeList() async {

    var employeeMapList = await getEmployeeMapList(); // Get 'Map List' from database
    int count = employeeMapList.length;         // Count the number of map entries in db table

    List<Employee> employeeList = List<Employee>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      employeeList.add(Employee.fromMapObject(employeeMapList[i]));
    }

    return employeeList;
  }
}
