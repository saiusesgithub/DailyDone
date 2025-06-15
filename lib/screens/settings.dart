import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Color currentAccent;
  final ValueChanged<Color> onAccentColorChanged;
  const SettingsPage({
    super.key,
    required this.currentAccent,
    required this.onAccentColorChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<Color, String> accentColors = {
    Color.fromRGBO(255, 94, 87, 1.0): "Red Peach",
    Color.fromRGBO(50, 224, 196, 1.0): 'Mint Green',
    Color.fromRGBO(58, 134, 255, 1.0): 'Royal Blue',
    Color.fromRGBO(255, 182, 39, 1.0): 'Amber',
  };

  late Color selectedAccent;
  @override
  void initState() {
    super.initState();
    selectedAccent = widget.currentAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: selectedAccent,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text(
              "Accent Colour",
              style: TextStyle(color: selectedAccent),
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
                  widget.onAccentColorChanged(newcolor);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
