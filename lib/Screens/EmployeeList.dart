import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database_demo/Screens/AddEmployeeScreen.dart';
import 'package:flutter_database_demo/models/Employee.dart';
import 'package:flutter_database_demo/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<Employee> employeelist;
  int count = 0;
  bool _status=false;

  @override
  Widget build(BuildContext context) {
    if (employeelist == null) {
      employeelist = List<Employee>();
      updateListView();
    }

    debugPrint(employeelist.length.toString());

    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        title: new Text("Database Demo"),
      ),
      body: !_status
          ? new Center(
              child: Text('No Employee Records Found'),
            )
          : new Column(
              children: <Widget>[
                new Expanded(
                    child: new ListView.builder(
                        itemCount: employeelist.length,
                        itemBuilder: (BuildContext ctxt, int Index) {
                          return new Card(
                            color: Colors.white,
                            elevation: 2.0,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.supervised_user_circle),
                              ),
                              title: Text(this.employeelist[Index].name),
                              subtitle: Text(this.employeelist[Index].designation),
                              trailing: GestureDetector(
                                  child: Icon(Icons.delete, color: Colors.grey),
                                  onTap: () {
                                    _delete(context, employeelist[Index]);
                                  }),
                              onTap: () {
                                debugPrint("List Tile Tapped");
                                navigateToDetail(
                                    this.employeelist[Index], 'Edit Employee');
                              },
                            ),
                          );
                        })),
              ],
            ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _openAddingScreen(Employee('', '', '', ''), 'Add Employee');
        },
        backgroundColor: Colors.blue,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );

    // TODO: implement build
  }

  void _delete(BuildContext context, Employee employee) async {
    int result = await dataBaseHelper.deleteEmployee(employee.id);
    debugPrint(result.toString());
    if (result != 0) {
      _showSnackBar(context, 'Employee deleted successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String s) {
   /* final snackBar = SnackBar(content: Text(s));
    Scaffold.of(context).showSnackBar(snackBar);*/

    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        bgcolor: "#008ECC",
        textcolor: '#ffffff'
    );
  }

  void _openAddingScreen(Employee note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddEmployeeScreen(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateListView() {
    final Future<Database> dbFuture = dataBaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Employee>> noteListFuture = dataBaseHelper.getEmployeeList();
      noteListFuture.then((employeelist) {
        setState(() {
          this.employeelist = employeelist;
          this.count = employeelist.length;
          if (count == 0) {
            _status = false;
          } else {
            _status = true;
          }
        });
      });
    });
  }

  void navigateToDetail(Employee employee, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddEmployeeScreen(employee, title);
    }));

    if (result == true) {
      updateListView();
    }
  }
}
