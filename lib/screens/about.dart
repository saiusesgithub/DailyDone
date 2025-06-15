import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// void _launchURL(String url) async {
//   final uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   }
// }

void _launchURL(BuildContext context,String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not open link')),
    );
  }
}


class AboutPage extends StatefulWidget {
  final Color accentColor;
  const AboutPage({super.key,required this.accentColor});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: widget.accentColor,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Add Logo Here", style: TextStyle(color: Colors.white)),
          ),
          Text(
            "DailyDone",
            style: TextStyle(
              color: widget.accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(
            "version 0.1",
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 12,
            ),
          ),

          SizedBox(height: 70),
          Divider(),
          SizedBox(height: 200),

          Text(
            "Developed by",
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "sAI sRUJAN",
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Student | Flutter App Developer",
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    _launchURL(context,"https://github.com/saiusesgithub/"),
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: widget.accentColor,
                ),
              ),

              IconButton(
                onPressed: () =>
                    _launchURL(context,"https://linkedin.com/in/saisrujanpunati/"),
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: widget.accentColor,
                ),
              ),

              IconButton(
                onPressed: () =>
                    _launchURL(context,"https://instagram.com/__saisrujan__"),
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: widget.accentColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
