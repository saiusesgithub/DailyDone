import 'package:flutter/material.dart';

class Addingtask extends StatefulWidget {
  const Addingtask({super.key});

  @override
  State<Addingtask> createState() => _AddingtaskState();
}

class _AddingtaskState extends State<Addingtask> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  bool priority = false;
  DateTime? duedate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(
          "Add New Task",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
        foregroundColor: Color.fromRGBO(255, 94, 87, 1.0),
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: titlecontroller,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(255, 94, 87, 1.0)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(255, 94, 87, 1.0)),
              ),
              labelText: "Title",
              labelStyle: TextStyle(
                color: Color.fromRGBO(255, 94, 87, 1.0),
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              floatingLabelAlignment: FloatingLabelAlignment.center,
            ),
          ),
          
          SizedBox(height: 20,),

          TextField(
            controller: descriptioncontroller,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(255, 94, 87, 1.0)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(255, 94, 87, 1.0)),
              ),
              labelText: "Description",
              labelStyle: TextStyle(
                color: Color.fromRGBO(255, 94, 87, 1.0),
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              floatingLabelAlignment: FloatingLabelAlignment.center,
            ),
            maxLines: 3,
          ),


          SizedBox(height: 20),
          SwitchListTile(
            value: priority,
            onChanged: (value) {
              setState(() {
                priority = value;
              });
            },
            title: Text(
              "Mark As Important",
              style: TextStyle(color: Color.fromRGBO(255, 94, 87, 1.0)),
            ),
            inactiveThumbColor: Color.fromRGBO(255, 94, 87, 1.0),
            inactiveTrackColor: Color.fromRGBO(13, 13, 13, 1.0),
            activeColor: Color.fromRGBO(13, 13, 13, 1.0),
            activeTrackColor: Color.fromRGBO(255, 94, 87, 1.0),
          ),

          ElevatedButton(
            onPressed: () {},
            child: Text("Add"),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color.fromRGBO(255, 94, 87, 1.0),
              ),
              foregroundColor: WidgetStatePropertyAll(
                Color.fromRGBO(13, 13, 13, 1.0),
              ),
              minimumSize: WidgetStatePropertyAll(Size(100, 40)),
            ),
          ),
        ],
      ),
    );
  }
}
