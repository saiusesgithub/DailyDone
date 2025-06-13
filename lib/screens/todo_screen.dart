import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text("DailyDone", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: Color.fromRGBO(255, 94, 87, 1.0),
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [Icon(Icons.search)],
        actionsPadding: EdgeInsets.only(right: 12),
      ),
      body: Container(),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Color.fromRGBO(255, 94, 87, 1.0),
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            label: 'Todo',
          ),
          NavigationDestination(
            icon: Icon(Icons.whatshot_outlined),
            label: 'Habits',
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(13, 13, 13, 1.0)),
              child: Column(
                children: [
                  Text(
                    "Put The Logo Here",
                    style: TextStyle(color: Color.fromRGBO(255, 94, 87, 1.0)),
                  ),

                  Text(
                    "DailyDone",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 94, 87, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Divider(color: Colors.grey[800]),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(color: Color.fromRGBO(255, 94, 87, 1.0)),
              ),
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                "About",
                style: TextStyle(color: Color.fromRGBO(255, 94, 87, 1.0)),
              ),
            ),
            SizedBox(height: 420),

            ElevatedButton(
              onPressed: () {},

              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Color.fromRGBO(255, 94, 87, 1.0),
                ),
                foregroundColor: WidgetStateProperty.all(
                  Color.fromRGBO(18, 18, 18, 1.0),
                ),
              ),
              child: Text("Reset Data"),
            ),
          ],
        ),
      ),
    );
  }
}
