import 'package:emails/model/mails_data.dart';
import 'package:emails/model/user_data.dart';
import 'package:emails/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  int pageNumber = 0;
  Widget build(BuildContext context) {
    List<String> appBarName = [
      'Contacts',
      'Mails',
      'Profile',
    ];
    List<Widget> bodyWidget = [
      Center(
        child: ListView.builder(
          itemCount: UserData.name.length,
          itemBuilder: (context, i) => Contact(
              name: UserData.name[i],
              email: UserData.email[i],
              phoneNumber: UserData.phoneNumber[i]),
        ),
      ),
      Center(
        child: ListView.builder(
          itemCount: MailsData.name.length,
          itemBuilder: (context, i) => Mails(
            nameUser: MailsData.name[i],
            mailUser: MailsData.mail[i],
          ),
        ),
      ),
      Center(
        child: Profile(),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:10.0,left:10.0),
                child: Row(
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(UserData.picUrl),
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Text(
                        UserData.nameUser,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Container(
                  width: 300,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ),
              nav_data(
                content: 'Social',
                icon1: Icon(
                  Icons.people_rounded,
                  color: Colors.black,
                ),
              ),
              nav_data(
                content: 'Promotions',
                icon1: Icon(
                  CupertinoIcons.tag_fill,
                  color: Colors.black,
                ),
              ),
              nav_data(
                content: 'Started',
                icon1: Icon(
                  CupertinoIcons.star,
                  color: Colors.black,
                ),
              ),
              nav_data(
                content: 'Snoozed',
                icon1: Icon(
                  CupertinoIcons.clock,
                  color: Colors.black,
                ),
              ),
              nav_data(
                content: 'Important',
                icon1: Icon(
                  Icons.label_important,
                  color: Colors.black,
                ),
              ),
              nav_data(
                content: 'sent',
                icon1: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
              ),
              nav_data(
                content: 'All mails',
                icon1: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
              ),

            ],
          ),
        ),
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            shadowColor: Colors.grey,
            elevation: 5,
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right:50.0),
                child: Text(
                  appBarName[pageNumber],
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )),
        body: bodyWidget[pageNumber],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: pageNumber,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.phone_fill,
                ),
                label: 'Contacts'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Mails'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
          ],
          onTap: (index) {
            setState(() {
              pageNumber = index;
            });
          },
        ),
      ),
    );
  }
}

class nav_data extends StatelessWidget {
  String content;
  Icon icon1;

  nav_data({this.content,this.icon1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0,left:20.0),
      child: Row(
      children: [
        icon1,
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            content,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
          ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 698, //600
          decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  //Color(0xff0d69ff).withOpacity(0.0),
                  Color(0xFFFAFAFA).withOpacity(0.10),
                  Color(0xFFFAFAFA).withOpacity(0.5),
                  Color(0xFF4FC3F7).withOpacity(0.5),
                  Color(0xFF4FC3F7).withOpacity(0.5),
                  Color(0xFF4FC3F7).withOpacity(0.20),
                ],
                stops: [
                  0.0,
                  0.25,
                  0.7,
                  0.75,
                  2.0
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          //Color(0xff0d69ff).withOpacity(0.0),
                          Color(0xFF4FC3F7).withOpacity(0.20),
                          Color(0xFFB3E5FC).withOpacity(0.5),
                          Color(0xFF4FC3F7).withOpacity(0.5),
                          Color(0xFF4FC3F7).withOpacity(0.5),
                          Color(0xFF4FC3F7).withOpacity(0.20),
                        ],
                        stops: [
                          0.0,
                          0.25,
                          0.7,
                          0.75,
                          2.0
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 70.0, bottom: 10.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30.0,
                            backgroundImage: NetworkImage(UserData.picUrl),
                          ),
                        ),
                      ),
                      Text(
                        UserData.nameUser,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        UserData.emailUser,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                profile_data(
                  content: UserData.phoneNumberUser,
                  icon1: Icon(
                    CupertinoIcons.phone_fill,
                    color: Colors.black,
                  ),
                ),
                profile_data(
                  content: 'Dashboard',
                  icon1: Icon(
                    Icons.dashboard,
                    color: Colors.black,
                  ),
                ),
                profile_data(
                  content: 'Logout',
                  icon1: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class profile_data extends StatelessWidget {
  String content;
  Icon icon1;

  profile_data({this.content, this.icon1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 30.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            //decoration:
                //BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              },
              color: Colors.lightBlue[200],
              child: icon1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              content,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Mails extends StatelessWidget {
  String nameUser, mailUser;
  Mails({this.nameUser, this.mailUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 350.0,
      height: 130.0,
      decoration: BoxDecoration(
        //color: Colors.blue.shade200,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              //Color(0xff0d69ff).withOpacity(0.0),
              Color(0xFF4FC3F7).withOpacity(0.20),
              Color(0xFFB3E5FC).withOpacity(0.5),
              Color(0xFF4FC3F7).withOpacity(0.5),
              Color(0xFF4FC3F7).withOpacity(0.5),
              Color(0xFF4FC3F7).withOpacity(0.20),
            ],
            stops: [
              0.0,
              0.25,
              0.7,
              0.75,
              2.0
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 30.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      backgroundImage: NetworkImage('https://png.pngitem.com/pimgs/s/567-5671266_tiscali-mail-transparent-background-sketchfab-logo-hd-png.png'),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameUser,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          mailUser,
                          style: TextStyle(
                            fontSize: 17.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey[10],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  String name, email, phoneNumber;
  Contact({this.name, this.email, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 350.0,
      height: 130.0,
      decoration: BoxDecoration(
        //color: Colors.blue.shade200,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              //Color(0xff0d69ff).withOpacity(0.0),
              Color(0xFF4FC3F7).withOpacity(0.20),
              Color(0xFFB3E5FC).withOpacity(0.5),
              Color(0xFF4FC3F7).withOpacity(0.5),
              Color(0xFF4FC3F7).withOpacity(0.5),
              Color(0xFF4FC3F7).withOpacity(0.20),
            ],
            stops: [
              0.0,
              0.25,
              0.7,
              0.75,
              2.0
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40.0,
                backgroundImage: NetworkImage(UserData.picUrl),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          email,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.phone_fill,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          phoneNumber,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
