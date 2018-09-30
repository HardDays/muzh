import 'package:flutter/material.dart';

import 'assigned_orders_page.dart';
import 'created_orders_page.dart';
import 'near_orders_page.dart';
import 'profile_page.dart';


class MainPage extends StatefulWidget {

  MainPage(){
  }

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  TabController controller;
  List pages;
  List firstTab;

  MainPageState(){

  }

  @override
  void initState() {
    super.initState();
    
    firstTab = [AssignedOrdersPage(), CreatedOrdersPage()];
    pages = [firstTab[0], NearOrdersPage(), ProfilePage()];

    for (var page in pages){
      page.onLoad = onAppBarLoad;
    }

    for (var page in firstTab){
      page.onSwitch = onSwitch;
      page.onLoad = onAppBarLoad;
    }

    controller = TabController(length: 3, vsync: this, initialIndex: 1);
  }
  
  void onAppBarLoad(Widget appbar){
    setState(() {
          
    });
  }

  void onSwitch(int index){
    setState(() {
      pages[0] = firstTab[index];
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildAppBar(){
    return PreferredSize( 
      preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
      child: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        elevation: 1.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children:[
            Container(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              width: 40.0,
              height: 40.0,
              child: Icon(Icons.work)
            ),
            Text('Муж на час',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 20.0,
               // fontStyle: FontStyle.italic
              ),
            )
          ]
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).accentColor),
            onPressed: () {   
                         
            }
           )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      resizeToAvoidBottomPadding: false,
     appBar: pages[controller.index].appBar ?? buildAppBar(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: List<Widget>.from(pages),
        controller: controller,
      ),
      bottomNavigationBar: Material(
        child: Container(
          height: 57.0,
          child: Column(
            children: [
              Divider(height: 5.0),
              TabBar(            
                indicatorColor: Theme.of(context).primaryColor,
                tabs: [
                  Container(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Icon(Icons.calendar_today,
                         color: controller.index == 0 ? Theme.of(context).accentColor : Theme.of(context).primaryColorDark
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.0)),
                        Text('Мои заказы',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: controller.index == 0 ? Theme.of(context).accentColor : Theme.of(context).primaryColorDark,
                            fontSize: 12.0
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 3.0))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Icon(
                          Icons.build,
                          color: controller.index == 1 ? Theme.of(context).accentColor : Theme.of(context).primaryColorDark
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.0)),
                        Text('Работа',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: controller.index == 1 ? Theme.of(context).accentColor : Theme.of(context).primaryColorDark,
                            fontSize: 12.0
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 3.0))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Icon(Icons.person,
                          color: controller.index == 2 ? Theme.of(context).accentColor : Theme.of(context).primaryColorDark
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.0)),
                        Text('Профиль',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: controller.index == 2 ? Theme.of(context).accentColor : Theme.of(context).primaryColorDark,
                            fontSize: 12.0
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 3.0))
                      ],
                    ),
                  ),
                ], 
                controller: controller,
              ), 
            ]
          ),
        ),
      ),
    );
  }
}

