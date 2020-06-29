
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/utils/TabComponents/monthly.dart';
import 'package:intelogsapp/utils/TabComponents/today.dart';
import 'TabComponents/weekly.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeScreen> with SingleTickerProviderStateMixin{

//  final List<Tab> tabs = <Tab>[
//    new Tab(text: "Today"),
//    new Tab(text: "Weekly"),
//    new Tab(text: "Monthly")
//  ];
//
//  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //_tabController = new TabController(vsync: this, length: tabs.length);
  }

//  @override
//  void dispose() {
//    _tabController.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Task Sheet", style: TextStyle(color: Colors.amber.shade400, fontWeight: FontWeight.bold, fontSize: 30),),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(

                    gradient: LinearGradient(
                        colors: [Colors.amber.shade400, Colors.amber.shade400]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Todays"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Weekly"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Monthly"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Todays(),
            Weekly(),
            Monthly()
          ]),
        )
    );

//    return new Scaffold(
//      appBar: new AppBar(
//        //title: Text('Bubble Tab Indicator'),
//        bottom: new TabBar(
//          isScrollable: true,
//          unselectedLabelColor: Colors.grey,
//          labelColor: Colors.white,
//          indicatorSize: TabBarIndicatorSize.tab,
//          indicator: new BubbleTabIndicator(
//            indicatorHeight: 25.0,
//            indicatorColor: Colors.amber.shade400,
//            tabBarIndicatorSize: TabBarIndicatorSize.tab,
//          ),
//          tabs: tabs,
//          controller: _tabController,
//        ),
//      ),
//      body: new TabBarView(
//        controller: _tabController,
//        children: tabs.map((Tab tab) {
//          return new Center(
//              child: new Text(
//                tab.text,
//                style: new TextStyle(
//                  fontSize: 20.0
//                ),
//              )
//          );
//        }).toList(),
//      ),
//    );
  }
}