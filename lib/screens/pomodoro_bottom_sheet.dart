import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var ggg = 8;

class BottomSheetUp extends StatelessWidget {
  final breakCallBack;
  final workCallBack;
  final String selectedTime;

  const BottomSheetUp({
    Key? key,
    required this.selectedTime,
    required this.breakCallBack,
    required this.workCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(36),
        // padding:
        //     EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 50, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //---- Shadow

                    Container(
                      alignment: Alignment.center,
                      width: 180,
                      height: 80,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            colors: [Colors.white, Color(0xfff1f1f1)],
                            stops: [0.1, 0.9],
                          ),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 3, right: 15),
                            child: Text(
                              "زمان استراحت",
                              style: GoogleFonts.harmattan(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.emoji_food_beverage, size: 50),
                        ],
                      ),
                    ),
                    Container(
                      child: PopupMenuButton(
                        onSelected: breakCallBack,
                        padding: EdgeInsets.all(30),
                        elevation: 10,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('۵ دقیقه'),
                            value: 5,
                          ),
                          PopupMenuItem(
                            child: Text('۷ دقیقه'),
                            value: 7,
                          ),
                          PopupMenuItem(
                            child: Text('۱۰ دقیقه'),
                            value: 10,
                          ),
                          PopupMenuItem(
                            child: Text('۱۵ دقیقه'),
                            value: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 50, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //---- Shadow

                    Container(
                      alignment: Alignment.center,
                      width: 180,
                      height: 80,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            colors: [Colors.white, Color(0xfff1f1f1)],
                            stops: [0.1, 0.9],
                          ),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 3, right: 15),
                            child: Text(
                              "زمان استراحت",
                              style: GoogleFonts.harmattan(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.work, size: 50),
                        ],
                      ),
                    ),
                    Container(
                      child: PopupMenuButton(
                        onSelected: workCallBack,
                        padding: EdgeInsets.all(30),
                        elevation: 10,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('۲۵ دقیقه'),
                            value: 25,
                          ),
                          PopupMenuItem(
                            child: Text('۳۰ دقیقه'),
                            value: 30,
                          ),
                          PopupMenuItem(
                            child: Text('۳۵ دقیقه'),
                            value: 35,
                          ),
                          PopupMenuItem(
                            child: Text('۴۰ دقیقه'),
                            value: 40,
                          ),
                          PopupMenuItem(
                            child: Text('۴۵ دقیقه'),
                            value: 45,
                          ),
                          PopupMenuItem(
                            child: Text('۵۰ دقیقه'),
                            value: 50,
                          ),
                          PopupMenuItem(
                            child: Text('۵۵ دقیقه'),
                            value: 55,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: FloatingActionButton(
                  elevation: 10,
                  child: Icon(Icons.check_circle_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
