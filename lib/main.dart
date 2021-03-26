import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    contacts.add(new Contact(name: "Love", phone: "123456789", type: ContactType.FAVORITE));
    contacts.add(new Contact(name: "I", phone: "123456789", type: ContactType.CELLPHONE));
    contacts.add(new Contact(name: "Stephen", phone: "123456789", type: ContactType.WORKER));
    contacts.add(new Contact(name: "Mother", phone: "123456789", type: ContactType.FAVORITE));
    contacts.add(new Contact(name: "Steve", phone: "123456789", type: ContactType.ANYONE));
    contacts.add(new Contact(name: "Father", phone: "123456789", type: ContactType.FAVORITE));
    contacts.add(new Contact(name: "Brother", phone: "123456789", type: ContactType.FAVORITE));
    contacts.add(new Contact(name: "Mother", phone: "123456789", type: ContactType.HOME));
    contacts.add(new Contact(name: "Sister", phone: "123456789", type: ContactType.ANYONE));
    contacts.add(new Contact(name: "Worker", phone: "123456789", type: ContactType.WORKER));

    contacts.sort((a,b)=> a.name.compareTo(b.name));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index){
            var contact = contacts[index];
            return ListTile(
              leading: CircleAvatar(
                child: ContactHelper.getIconByContactType(contact.type),
                backgroundColor: Colors.blue[200],
              ),
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => {},
                ),
            );
          },
          separatorBuilder: (context, index)=> Divider(),
          itemCount: contacts.length
      )
    );
  }
}

class Contact{
  final String name;
  final String phone;
  final ContactType type;
  Contact({@required this.name, @required this.phone, @required this.type});
}

enum ContactType {HOME, WORKER, FAVORITE, CELLPHONE, ANYONE}

class ContactHelper{
  static Icon getIconByContactType(ContactType type){
    switch(type){
      case ContactType.ANYONE:
        return Icon(Icons.phone_android, color: Colors.grey[700]);
      case ContactType.CELLPHONE:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContactType.FAVORITE:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContactType.WORKER:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContactType.HOME:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}