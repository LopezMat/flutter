import 'package:flutter/material.dart';
import 'package:good_meal/models/UrlClass.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatelessWidget {
  final UrlClass urlClass;
  UrlButton({required this.urlClass});

  @override
  Widget build(BuildContext context) {
    Uri uri = Uri.parse(urlClass.url);
    return TextButton(
        onPressed: () async{
          await canLaunchUrl(uri) ?
              launchUrl( uri, mode : LaunchMode.externalApplication) :
                throw "impossible de lancer ${urlClass.name}";
        },
        child: Text(urlClass.name));
  }
}
