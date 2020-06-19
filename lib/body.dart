import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import './style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//I put a comments , because filter not working

class Body extends StatefulWidget {

  Body() : super();
  @override
  _Body createState() => _Body();
}
//create Debounce class for reducing delay.

// Purpose :   After typing or selecting , It shows the table as particular time space. even it uses for server hit also.
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  // create run method for performing time cancel
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _Body extends State<Body> {
  String yearValue;
  String monthValue;
  String branchValue;
  String regno;
  List records = [];
  // create the object for class Debouncer
  // it increasing the wait time add milliseconds : 200

  final _debouncer = Debouncer(milliseconds: 200);

  //only one textfield using for getting regno
  final regnoController = TextEditingController();

  //heading styles



  // final _postDataSource = PostDataSource(filterdetails, selectedStudents);



  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    final yearDrop = DropdownButton<String>(
      hint: Text(
        'Select Due Year',
        textAlign: TextAlign.center,
      ),
      value: yearValue,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      items: <DropdownMenuItem<String>>[
        //getDropDownMenuItem('2017', '2017'),
        getDropDownMenuItem('2017', '2017'),
        getDropDownMenuItem('2018', '2018'),
        getDropDownMenuItem('2019', '2019'),
        getDropDownMenuItem('2020', '2020'),
        getDropDownMenuItem('2021', '2021'),
        getDropDownMenuItem('2022', '2022'),
      ],
      onChanged: (String value) {
        setState(() {
          yearValue = value;

          print(yearValue);
          _debouncer.run(() {
            setState(() {
              //filterdetails = details
                //  .where((element) => (element.lastdueyear.contains(yearValue)))
                  //.toList();
            });
          });
        });
      },
    );
    final monthDrop = DropdownButton<String>(
      value: monthValue,
      hint: Text(
        'Select Due Month',
        textAlign: TextAlign.center,
      ),
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      items: <DropdownMenuItem<String>>[
        getDropDownMenuItem('JAN', 'JAN'),
        getDropDownMenuItem('FEB', 'FEB'),
        getDropDownMenuItem('MAR', 'MAR'),
        getDropDownMenuItem('APR', 'APR'),
        getDropDownMenuItem('MAY', 'MAY'),
        getDropDownMenuItem('JUNE', 'JUNE'),
        getDropDownMenuItem('JULY', 'JULY'),
        getDropDownMenuItem('AUG', 'AUG'),
        getDropDownMenuItem('SEP', 'SEP'),
        getDropDownMenuItem('OCT', 'OCT'),
        getDropDownMenuItem('NOV', 'NOV'),
        getDropDownMenuItem('DEC', 'DEC'),
      ],
      onChanged: (String value) {
        setState(() {
          monthValue = value;
          print(monthValue);
          _debouncer.run(() {
            setState(() {
             // filterdetails = details
               //   .where((element) =>
              //(element.lastduemonth.toUpperCase().contains(monthValue)))
                //  .toList();
            });
          });
        });
      },
    );

    final branchDrop = DropdownButton<String>(
      hint: Text(
        'Select Branch',
        textAlign: TextAlign.center,
      ),
      value: branchValue,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      items: <DropdownMenuItem<String>>[
        getDropDownMenuItem('CSE', 'CSE'),
        getDropDownMenuItem('ECE', 'ECE'),
        getDropDownMenuItem('EEE', 'EEE'),
        getDropDownMenuItem('CIVIL', 'CIVIL'),
        getDropDownMenuItem('MECH', 'MECH'),
      ],
      onChanged: (String value) {
        setState(() {
          branchValue = value;
          print(branchValue);
          //create a filtering students details based on branch.
          _debouncer.run(() {
            setState(() {
              //filterdetails = details
                //  .where((element) => (element.branch.contains(branchValue)))
                  //.toList();
            });
          });
        });
      },
    );


    Size size = MediaQuery
        .of(context)
        .size;

    return Column(
      children: <Widget>[
        Container(
            width: size.width - size.width / 5,
            height: size.height - size.height / 5,
            padding: const EdgeInsets.all(7.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 5,
                        height: MediaQuery
                            .of(context)
                            .size
                            .width / 25,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            border:
                            Border.all(color: Colors.black87, width: 2)),
                        child: yearDrop,
                      ),

                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 5,
                        height: MediaQuery
                            .of(context)
                            .size
                            .width / 25,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            border:
                            Border.all(color: Colors.black87, width: 2)),
                        child: monthDrop,
                      ),

                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 5,
                        height: MediaQuery
                            .of(context)
                            .size
                            .width / 25,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            border:
                            Border.all(color: Colors.black87, width: 2)),
                        child: branchDrop,
                      ),

                      //monthBox(size),

                      // searchBox(),
                    ],
                  ),
                  inputBox('Search Reg.no.', TextInputType.number,
                      Icon(Icons.search, size: 28, color: Colors.black87)),
                  Container(
                    height: size.height / 2,
                    width: size.width,

                    child: /*StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection('2017-2021').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(!snapshot.hasData) // Text("Loading..");
                        return Text("Loading");
                        return new ListView(
                          children:snapshot.data.documents.map((DocumentSnapshot document){

                          }).toList(),
                        );


                      },



                      
                    )*/tabledetails(),

                  )
                ]))
      ],
    );
  }

  //datatable


  SingleChildScrollView tabledetails() {
    int _rowperpage = PaginatedDataTable.defaultRowsPerPage;
    int _columnIndex = 1;
    bool _issorting  = true;
    String name='';
    String rollno='';
    String slno='';

    return SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: PaginatedDataTable(

          header: Text('Students Records',style:Style.headStyle),
            columns: [
              DataColumn(label: Text('sl.no', style: Style.headStyle,
              )),
              DataColumn(
                  label: Text(
                    'Rollno.',
                    style: Style.headStyle,
                  )),
              DataColumn(
                  label: Text(
                    'Name',style: Style.headStyle,
                  )),
              DataColumn(
                  label: Text(
                    'Branch',
                    style: Style.headStyle,
                  )),
              DataColumn(
                  label: Text(
                    'Batch',
                    style: Style.headStyle,
                  )),
              DataColumn(label: Text('Duemonth', style: Style.headStyle)),
              DataColumn(label: Text('DueYear', style: Style.headStyle)),
              DataColumn(
                  label: Text(
                    'Status',
                    style: Style.headStyle,
                  )),
              DataColumn(
                  label: Text(
                    'View',
                    style: Style.headStyle,
                  )),
            ],
            source: DTS(),
          rowsPerPage: _rowperpage-5,
          availableRowsPerPage:  <int> [_rowperpage,_rowperpage-5,_rowperpage-7],
          onRowsPerPageChanged: (b){
            setState(() {
              _rowperpage=b;

            });
          },



            ));

  }

  Widget getDropDownMenuItem(String text, String value) {
    return DropdownMenuItem(
      child: new Text(text),
      value: value,
    );
  }

  Widget inputBox(String label, TextInputType t, Icon icon) {
    return Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 25,
        child: TextFormField(
          controller: regnoController,
          keyboardType: t,
          autofocus: false,
          onTap: () {
            print(regnoController.text);
            regno = regnoController.text;
            _debouncer.run(() {
              setState(() {
              //  filterdetails = details
                //    .where(
                  //      (element) => (element.rollno.contains(regno)))
                   // .toList();
              });
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.black87, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.black87, width: 3)),
            labelText: label,
            labelStyle: TextStyle(color: Colors.blueGrey),
            suffixIcon: icon,
          ),
          cursorColor: Colors.black87,
          showCursor: true,
        ));
  }
}


class DTS extends DataTableSource{

  String slno ='';
  String rollno = '';
  String name ='';
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index,cells:[


            DataCell(Text(
              slno,
              style: Style.subheadStyle,
            )),
            DataCell(Text(
              rollno,
              style: Style.subheadStyle,
            )),
            DataCell(Text(
              name,
              style: Style.subheadStyle,
            )),
            DataCell(Text(
              "cse",
              style: Style.subheadStyle,
            )),
            DataCell(Text(
              "2017",
              style: Style.subheadStyle,
            )),
            DataCell(
                Text("jan", style: Style.subheadStyle)),
            DataCell(Text(
              "feb",
              style: Style.subheadStyle,
            )),
            DataCell(Text(
              "paid",
              style: Style.subheadStyle,
            )),
            DataCell(RaisedButton(
              onPressed: () {},
              child: Text(
                'view',
                style: Style.headStyle,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ))
          ]);

  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 4;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;


}