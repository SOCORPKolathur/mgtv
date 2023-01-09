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

    return
      Scaffold(
        body:
        Padding(
          padding:EdgeInsets.only(top:10,left: 90),
          child: Container(
            width: 1200,
            color: Colors.yellowAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text( _timeString,style:TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),),
                    Text( _timeString1,style:TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      height: 25,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('Si No')),
                    ),
                    Container(
                      height: 25,
                      width: 360,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('Operator')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('1')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('2')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('3')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('4')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('5')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('6')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('7')),
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('8')),
                    ),
                    Container(
                      height: 25,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('Total')),
                    ),

                  ],
                ),
                StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance
                  .collection('operator')
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
                          SizedBox(width: 10,),
                          Container(
                            height: 25,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text(index.toString())),
                          ),
                          Container(
                            height: 25,
                            width: 360,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text(snapshot.data!.docs[index]["name"])),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('1')),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('2')),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('3')),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('4')),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('5')),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('6')),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('7')),
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('8')),
                          ),
                          Container(
                            height: 25,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text('Total')),
                          ),

                        ],
                      ),
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
