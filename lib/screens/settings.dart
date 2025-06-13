import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<Color, String> accentColors = {
    Color.fromRGBO(255, 94, 87, 1.0): "Red Peach",
    Color.fromRGBO(255, 107, 92, 1.0): "Softer Coral",
    Color.fromRGBO(255, 182, 166, 1.0): "Light Peach",
    Colors.tealAccent: "Teal",
    Colors.amber: "Amber",
  };

  Color selectedAccent = Color.fromRGBO(255, 94, 87, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: Color.fromRGBO(255, 94, 87, 1.0),
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text(
              "Accent Colour",
              style: TextStyle(color: Color.fromRGBO(255, 94, 87, 1.0)),
            ),
            trailing: DropdownButton(
              dropdownColor: Color.fromRGBO(13, 13, 13, 1.0),
              value: selectedAccent,
              items: accentColors.entries.map((entry) {
                return DropdownMenuItem<Color>(
                  value: entry.key,
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: entry.key,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(entry.value, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (Color? newcolor) {
                if (newcolor != null) {
                  setState(() {
                    selectedAccent = newcolor;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
