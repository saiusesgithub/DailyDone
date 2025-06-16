import 'package:daily_done/screens/habits_screen.dart';
import 'package:daily_done/screens/settings.dart';
import 'package:daily_done/screens/todo_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Color accentColor;
  final ValueChanged<Color> onAccentColorChanged;
  const HomeScreen({
    super.key,
    required this.accentColor,
    required this.onAccentColorChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      TodoScreen(accentColor: widget.accentColor),
      HabitsScreen(),
    ];

    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.9, 
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text("DailyDone", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: widget.accentColor,
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
      body: IndexedStack(index: selectedIndex, children: pages),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: widget.accentColor,
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

      drawer: SizedBox(
        width: 250,
        child: Drawer(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(10, 10, 10, 1.0),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/DailyDoneLogo_NoBackground.png',
                            height: 100,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.low,
                          ),
                
                          Text(
                            "DailyDone",
                            style: TextStyle(
                              color: widget.accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        "Settings",
                        style: TextStyle(color: widget.accentColor),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SettingsPage(
                              currentAccent: widget.accentColor,
                              onAccentColorChanged: widget.onAccentColorChanged,
                            ),
                          ),
                        );
                      },
                    ),
                
                    ListTile(
                      leading: Icon(Icons.info,),
                      title: Text(
                        "About",
                        style: TextStyle(color: widget.accentColor),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/about');
                      },
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 420),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},

                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        widget.accentColor,
                      ),
                      foregroundColor: WidgetStateProperty.all(
                        Color.fromRGBO(18, 18, 18, 1.0),
                      ),
                    ),
                    child: Text("Reset Data"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
