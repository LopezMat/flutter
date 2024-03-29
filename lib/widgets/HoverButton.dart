import 'package:flutter/material.dart';
import 'package:good_meal/models/ButtonObject.dart';

class HoverButton extends StatefulWidget {

  ButtonObject button;
  HoverButton({required this.button});

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {

  bool hoverValue = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hover){ // gestion du survol
        setState(() {
          hoverValue = hover;
        });
      },
      onTap: (){ // action du click
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return widget.button.destination;
        }));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.button.label ?? "",
              style: TextStyle(
                color: (hoverValue) ? Colors.red : Colors.yellowAccent,
              ),
            ),
            Container(
              height: 2,
              width: 50,
              color: (hoverValue) ? Colors.red : Colors.yellowAccent,
            )
          ],
        ),
      ),
    );
  }
}
