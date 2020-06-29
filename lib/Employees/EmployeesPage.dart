import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmployeesPageState();
  }

}

class _EmployeesPageState extends State<EmployeesPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //color: Colors.grey.shade100,
        color: Colors.grey.shade100,
        child: Scrollbar(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(12),
                  ),
                  Text("Department Incharge", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView(
                       scrollDirection: Axis.horizontal,
                      children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.75),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(4, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              //elevation: 10.0,
                              height: 30,
                              width: 155,
                              //color: Colors.grey,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      child:  CircleAvatar(
                                        backgroundImage: AssetImage('assets/image.jpg'),
                                        radius: 50,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2,bottom: 2),
                                  ),
                                  Text("Harry Potter", style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("@Departmental Incharge", style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Harry Potter", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Departmental Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Harry Potter", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Departmental Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Harry Potter", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Departmental Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text("Shift Incharge", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image2.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Sirius Black", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Shift Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image2.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Sirius Black", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Shift Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image2.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Sirius Black", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Shift Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image2.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Sirius Black", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Shift Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text("CEO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image5.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Albus Dumbledor", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@CEO", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image5.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Albus Dumbledor", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@CEO", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image5.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Albus Dumbledor", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@CEO", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image5.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Albus Dumbledor", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@CEO", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text("Section Incharge", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image3.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Remus Lupin", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Section Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image3.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Remus Lupin", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Section Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image3.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Remus Lupin", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Section Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image3.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Remus Lupin", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@Section Incharge", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text("General User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image4.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Hermione Granger", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@General User", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image4.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Hermione Granger", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@General User", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image4.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Hermione Granger", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@General User", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: (EdgeInsets.all(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.75),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          //elevation: 10.0,
                          height: 30,
                          width: 155,
                          //color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:  CircleAvatar(
                                    backgroundImage: AssetImage('assets/image4.jpg'),
                                    radius: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                              ),
                              Text("Hermione Granger", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("@General User", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}