import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

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
        foregroundColor: Color.fromRGBO(255, 94, 87, 1.0),
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
              color: Color.fromRGBO(255, 94, 87, 1.0),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(
            "version 0.1",
            style: TextStyle(
              color: Color.fromRGBO(255, 94, 87, 1.0),
              fontSize: 12,
            ),
          ),

          SizedBox(height: 70),
          Divider(),
          SizedBox(height: 200),

          Text(
            "Developed by",
            style: TextStyle(
              color: Color.fromRGBO(255, 94, 87, 1.0),
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "sAI sRUJAN",
            style: TextStyle(
              color: Color.fromRGBO(255, 94, 87, 1.0),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Student | Flutter App Developer",
            style: TextStyle(
              color: Color.fromRGBO(255, 94, 87, 1.0),
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    _launchURL("https://github.com/saiusesgithub/"),
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: Color.fromRGBO(255, 94, 87, 1.0),
                ),
              ),

              IconButton(
                onPressed: () =>
                    _launchURL("https://linkedin.com/in/saisrujanpunati/"),
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Color.fromRGBO(255, 94, 87, 1.0),
                ),
              ),

              IconButton(
                onPressed: () =>
                    _launchURL("https://instagram.com/__saisrujan__"),
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Color.fromRGBO(255, 94, 87, 1.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
