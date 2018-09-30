import 'package:flutter/material.dart';

import '../models/storage/cache.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  ProfileEditPageState createState() => ProfileEditPageState();
}

class ProfileEditPageState extends State<ProfileEditPage> {

  List<String> profileSkills = [];

  List<String> skills = [
    'Электротехника',
    'Сантехника',
    'Электропроводка',
    'Мелкий ремонт',
    'Перенос груза',
    'Уборка',
  ];

  String email;
  String phone;
  String firstName;
  String lastName;


  @override
  void initState(){
    profileSkills = Cache.user.skills ?? [];
    
    super.initState();
  }

  Widget buildAppBar(BuildContext context){
    return PreferredSize( 
      preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
      child: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        elevation: 1.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children:[
            Text('Изменить профиль',
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
      appBar: buildAppBar(context),
      body: SingleChildScrollView( 
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Theme.of(context).primaryColor)
                    ),
                    child: Icon(Icons.person,
                      color: Colors.grey,
                      size: MediaQuery.of(context).size.width * 0.3,
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextField(
                      //controller: TextEditingController(text: Cache.user.firstName),
                      decoration: InputDecoration(
                        hintText: 'Имя'
                      ),
                      onChanged: (val){
                        setState(() {
                          firstName = val;                          
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextField(
                      //controller: TextEditingController(text: Cache.user.lastName),
                      decoration: InputDecoration(
                        hintText: 'Фамилия'
                      ),
                      onChanged: (val){
                        setState(() {
                          lastName = val;                          
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextField(
                      //controller: TextEditingController(text: Cache.user.phone),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Телефон'
                      ),
                      onChanged: (val){
                        setState(() {
                          phone = val;                          
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextField(
                      //controller: TextEditingController(text: Cache.user.email),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Почта'
                      ),
                      onChanged: (val){
                        setState(() {
                          email = val;                          
                        });
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Text('Навыки',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54
                      ),
                    ), 
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                    child: Wrap(
                      spacing: 3.0,
                      children: List.generate(skills.length, 
                        (ind){
                          return ChoiceChip(
                            label: Text(skills[ind],
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            backgroundColor: Colors.grey.withAlpha(200),
                            selectedColor: Theme.of(context).primaryColor,
                            selected: profileSkills.contains(skills[ind]),
                            onSelected: (bool selected) {
                              setState(() {
                                if (profileSkills.contains(skills[ind])){
                                  profileSkills.remove(skills[ind]);
                                } else {
                                  profileSkills.add(skills[ind]);
                                }                               
                              });
                            },
                          );
                        }
                      )
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withAlpha(200),
                        ]
                      )
                    ),
                    child: FlatButton(
                      color: Colors.transparent,
                      child: Container(
                        height: 45.0,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text('СОХРАНИТЬ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                          )        
                        ),
                      ),
                      onPressed: (){
                        showDialog(context: context, 
                          child: AlertDialog(
                            title: Text('Успех'),
                            content: Text('Сохранено'),
                            actions: [
                              FlatButton(
                                child: Text('Ок'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }
                              ),
                            ]
                          ),        
                        );
                        setState(() {
                          Cache.user.firstName = firstName;
                          Cache.user.lastName = lastName;
                          Cache.user.phone = phone;
                          Cache.user.email = email;
                          Cache.user.skills = profileSkills;            
                        });
                      },
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
