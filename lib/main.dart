import 'package:flutter/material.dart';

const List<String> myList = [
  "game",
  "waqai",
  "kamal",
  "jamal",
  "bilal",
  "haseeb",
  "gamer",
  "boy",
  "messi",
  "ronaldo"
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cursorColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon myCustomIcon = Icon(Icons.search);
  Widget appbarText = Text("APPBAR");
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = myList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarText,
        actions: [
          IconButton(
            //always place search icon at start.
            icon: myCustomIcon,
            onPressed: () {
              setState(() {
                filteredList = myList;
                if (myCustomIcon.icon == Icons.search) {
                  appbarText = TextField(
                    autofocus: true,
                    onChanged: (newValue) {
                      setState(() {
                        // if you are fetching data from server. store it into list.
                        filteredList = myList
                            .where((element) =>
                                element //then use element['variable name inside model_class '].tolowerCase and so on.
                                    .toLowerCase()
                                    .contains(newValue.toLowerCase()))
                            .toList();
                      });
                    },
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                        hintText: "enter something...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.black38,
                        )),
                  );
                  myCustomIcon = Icon(Icons.close);
                } else {
                  myCustomIcon = Icon(Icons.search);
                  appbarText = Text("APPBAR");
                }
              });
            },
          ),
          IconButton(icon: Icon(Icons.title), onPressed: () {}),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filteredList[index]),
            );
          },
          itemCount: filteredList.length,
        ),
      ),
    );
  }
}
