import 'package:flutter/material.dart';
import 'package:personal_project/custom_styles.dart';
import 'package:personal_project/custom_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus',
      theme: ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: const Color(0xFFC98F2A),
            onPrimary: Colors.white,
            secondary: const Color(0xFF403C38),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            surface: const Color(0xFF272727),
            onSurface: Colors.white,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> goalsList = [];

  void addGoal(String text) {
    setState(() {
      goalsList.add(text);
      print("we added one. ${goalsList.length}");
    });
  }

  bool showFourthGoal = true;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: colorScheme.secondary,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.edit,
            color: colorScheme.primary,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'F o ( u s',
          style: textStyleColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('IconButton pressed ...');
            },
            icon: Icon(
                Icons.settings_sharp,
                color: colorScheme.primary,),
          ),
        ],
        centerTitle: true,
        elevation: 30,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 60),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GoalTile(context: context,
                    text: goalsList.length > 0 ? goalsList[0] : "ENTER",
                    priority: 0),
                GoalTile(context: context,
                    text: goalsList.length > 1 ? goalsList[1] : "ENTER",
                    priority: 1),
                GoalTile(context: context,
                    text: goalsList.length > 2 ? goalsList[2] : "ENTER",
                    priority: 2),
                showFourthGoal ? GoalTile(context: context, text: "goal 4", priority: 4): SizedBox(),
              ],
            ),
          ),
          Container(
            width: deviceSize.width / 2,
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.primary, width: 4),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: colorScheme.primary,
                size: 60,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: AddGoalBottomBar(
                        onPressed: addGoal,
                        context: context,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}