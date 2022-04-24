import 'package:assignment/HomePage.dart';
import 'package:assignment/weatherSearch.dart';
import 'package:flutter/material.dart';
import 'LoginLayout.dart';

class MyDrawer extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context){
    return Drawer(
        child: Material(
          color: Colors.white38,
          child:ListView(
            children:<Widget>[
              Container(
                padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectedItem(context,1),
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                text: 'Search by City',
                icon: Icons.search,
                onClicked: () => selectedItem(context,2),
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                text: 'View favourites',
                icon: Icons.favorite,
                onClicked: () => selectedItem(context,3),
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                text: 'Observations',
                icon: Icons.assignment_rounded,
                onClicked: () => selectedItem(context,4),
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                text: 'Log out',
                icon: Icons.arrow_back,
                onClicked: () => selectedItem(context,5),
              ),
            ],
          ),
        )
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
})
{
  final color = Colors.black;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop();
  switch(index){
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => weatherSearch(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginLayout(),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginLayout(),
      ));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginLayout(),
      ));
      break;


  }
}

