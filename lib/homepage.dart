import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class hmpage extends StatefulWidget {
  @override
  State<hmpage> createState() => _hmpageState();
}

class _hmpageState extends State<hmpage> {
  String _timeString='';
  String _timeString1='';
  ScrollController scrollController = ScrollController();
  var numbers = List<int>.generate(10, (n) => 100);
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    _timeString1 = _formatDateTime(DateTime.now());

    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime1());
    Timer.periodic(Duration(seconds: 25), (Timer t)
    {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => hmpage(),
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        ),
      );
    });
    Future.delayed(const Duration(seconds: 3), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 20), curve: Curves.linear);
    });




    super.initState();
  }
  @override
  Widget build(context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return
      Scaffold(
        body:
        Padding(
          padding:EdgeInsets.only(top:height/93.9,left:width/42),
          child: Container(
            width: width/1.05,
            color: Colors.yellowAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:height/93.9,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text( _timeString,style:TextStyle(
                      color: Colors.red,
                      fontSize: width/80,
                      fontWeight: FontWeight.w700
                    ),),
                    Text( _timeString1,style:TextStyle(
                      color: Colors.red,
                      fontSize: width/80,
                      fontWeight: FontWeight.w700
                    ),),
                  ],
                ),
                SizedBox(height:height/93.9,),
                Row(
                  children: [
                    SizedBox(width: width/168.0,),
                    Container(
                      height:height/18.78,
                      width:width/3.23,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('Rank',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width/84),)),
                    ),
                    Container(
                      height:height/18.78,
                      width:width/3.23,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('Operator Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width/84),)),
                    ),
                    Container(
                      height:height/18.78,
                      width:width/3.23,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('Target',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width/84),)),
                    ),

                  ],
                ),

                StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance
                  .collection('TV Details').doc("${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}").collection("Today").orderBy("target",descending: true)
                  .snapshots(),
              builder: (context, snapshot) {

                return snapshot.hasData
                    ? Expanded(
                      child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) =>
                      Row(
                        children: [
                          SizedBox(width: width/168.0,),
                          Container(
                            height:height/30,
                            width:width/3.23,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text((index+1).toString(),style: TextStyle(fontSize: width/120),)),
                          ),
                          Container(
                            height:height/30,
                            width:width/3.23,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text(snapshot.data!.docs[index]["opname"],style: TextStyle(fontSize: width/120),)),
                          ),
                          Container(
                            height:height/30,
                            width:width/3.23,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text(snapshot.data!.docs[index]["target"].toStringAsFixed(2),style: TextStyle(fontSize: width/120)),),
                          ),

                        ],
                      )
                ),
                    )
                    : Text('Loading...');
              },
            ),


              ],
            ),
          ),
        ),


    );
  }
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime1(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
  void _getTime1() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime1(now);
    setState(() {
      _timeString1 = formattedDateTime;
    });
  }


}
