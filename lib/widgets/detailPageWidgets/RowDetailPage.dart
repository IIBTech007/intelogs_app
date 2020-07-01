import 'package:flutter/material.dart';

class detailPageRowWidget {
  Widget rowdetailpage(String title, String content ,context) {

//      Container(
//      //padding: EdgeInsets.only(top: 15 ),
//      height: 55,
//      width: MediaQuery.of(context).size.width,
//      //height: MediaQuery.of(context).size.height * 0.075,
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(30),
//          color: Colors.grey.shade300
//      ),
//      child:
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(height: 55,
            width: MediaQuery.of(context).size.width/3,
            //height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15
              ),
              ),
            ),
          ),


         // Divider(color: Colors.yellow,height: 20,thickness: 10.0,),
          SizedBox(width: 10,),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.56,
            //height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content!=null?content:"", style: TextStyle(
                //fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15
              ),
              ),
            ),
          ),
        ],
      );
   // );
  }
  }