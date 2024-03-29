import 'package:flutter/material.dart';
import 'package:good_meal/models/ButtonObject.dart';
import 'package:good_meal/models/Constantes.dart';
import 'package:good_meal/widgets/Branding.dart';

class DrawerSmall extends StatelessWidget {
  const DrawerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
          itemBuilder: (context, index){
            if( index == 0){
              return Center(
                child: Container(
                    color: appBarColor,
                    child: Branding(fontTitleSize: 15,)
                ),
              );
            } else {
              ButtonObject button = menuButton[index - 1];
              return ListTile(
                title: Text(button.label ?? ""),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => button.destination));
                },
              );
            }
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: menuButton.length + 1),
    );
  }
}
