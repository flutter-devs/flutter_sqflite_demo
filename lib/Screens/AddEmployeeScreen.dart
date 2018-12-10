import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database_demo/models/Employee.dart';
import 'package:flutter_database_demo/utils/database_helper.dart';

class AddEmployeeScreen extends StatefulWidget {
  final String appBarTitle;
  final Employee employee;

  AddEmployeeScreen(this.employee, this.appBarTitle);

  @override
  AddEmployeeScreenState createState() =>
      new AddEmployeeScreenState(this.employee, this.appBarTitle);
}

class AddEmployeeScreenState extends State<AddEmployeeScreen> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<Employee> employeelist;
  int count = 0;
  final FocusNode myFocusNode = FocusNode();
  String appBarTitle;
  Employee employee;
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  AddEmployeeScreenState(this.employee, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    nameController.text = employee.name;
    designationController.text = employee.designation;
    mobileController.text = employee.mobile;
    fatherNameController.text = employee.fatherName;
    bloodGroupController.text = employee.bloodGroup;

    return new WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.blue,
              title: new Text(appBarTitle),
            ),
            body: new Container(
                color: Colors.white,
                child: new ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        new Container(
                          height: 250.0,
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: new Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                              width: 140.0,
                                              height: 140.0,
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                  image: new ExactAssetImage(
                                                      'assets/images/as.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 90.0, right: 100.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new CircleAvatar(
                                                backgroundColor: Colors.blue,
                                                radius: 25.0,
                                                child: new Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          )),
                                    ]),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Employee Information',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: nameController,
                                            onChanged: (value) {
                                              debugPrint(
                                                  'Something changed in Title Text Field');
                                              updateName();
                                            },
                                            decoration: const InputDecoration(
                                              hintText: "Enter Name",
                                            ),
                                            /* enabled: !_status,
                                      autofocus: !_status,*/
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Designation',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: designationController,
                                            onChanged: (value) {
                                              debugPrint(
                                                  'Something changed in Title Text Field');
                                              updateDesignation();
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "Enter Designation"),
                                            // enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Mobile',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: mobileController,
                                            onChanged: (value) {
                                              debugPrint(
                                                  'Something changed in Title Text Field');
                                              updateMobileNumber();
                                            },
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Enter Mobile Number"),
                                            // enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Father Name',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: fatherNameController,
                                            onChanged: (value) {
                                              debugPrint(
                                                  'Something changed in Title Text Field');
                                              updateFatherName();
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "Enter Father Name"),
                                            //  enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Blood Group',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0),
                                            child: new TextField(
                                              controller: bloodGroupController,
                                              onChanged: (value) {
                                                debugPrint('Something changed in Title Text Field');
                                                updateBloodGroup();
                                              },
                                              decoration: const InputDecoration(
                                                  hintText:
                                                      "Enter Blood Group"),
                                              // enabled: !_status,
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                _getActionButtons(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ))),
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        });

    // TODO: implement build
  }

  void _delete(BuildContext context, Employee employee) async {
    int result = await dataBaseHelper.deleteEmployee(employee.id);
    if (result != 0) {
      _showSnackBar(context, 'Employee deleted successfully');
    }
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text(appBarTitle),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    // _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _save();
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  void _save() async {
    moveToLastScreen();
    debugPrint(employee.name.toString());
    int result;
    if (employee.id != null) {
      // Case 1: Update operation
      result = await dataBaseHelper.updateEmployee(employee);
    } else {
      // Case 2: Insert Operation
      debugPrint("Name Inserted: " + employee.name);

      result = await dataBaseHelper.insertEmployee(employee);
    }
    debugPrint(result.toString());
    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Employee Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }


  void _showSnackBar(BuildContext context, String s) {
    final snackBar = SnackBar(content: Text(s));
    Scaffold.of(context).showSnackBar(snackBar);
  }


  void updateName() {
    employee.name = nameController.text;
  }

  void updateDesignation() {
    employee.designation = designationController.text;
  }

  void updateMobileNumber() {
    employee.mobile = mobileController.text;
  }

  void updateFatherName() {
    employee.fatherName = fatherNameController.text;
  }

  void updateBloodGroup() {
    employee.bloodGroup = bloodGroupController.text;
  }
}
