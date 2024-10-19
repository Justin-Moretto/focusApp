import 'package:flutter/material.dart';
import 'package:personal_project/classes.dart';
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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addGoal(String text) {
    Goal newGoal = Goal(
        text: text,
        priority:  goalsList.length
    );
    setState(() {
      goalsList.add(newGoal);
      print("we added one. ${goalsList.length}");
    });
  }

  AlertDialog editOrDeleteGoalDialog(Goal goal, BuildContext context) {
    return AlertDialog(
      title: Text("Delete or edit"),
      backgroundColor: Colors.brown,
      content: SizedBox(
        height: deviceSize.height / 5,
        child: Column(
          children: [
            Text(goal.text!),
            goalsList.length > 1 ? StatefulBuilder(
              builder: (context, SetState) {
                return Slider(
                    value: currentSliderValue,
                    min: 0,
                    max: goalsList.length - 1,
                    divisions: goalsList.length - 1,
                    onChanged: (newValue) {
                      SetState((){
                        currentSliderValue = newValue;
                      });
                    });
              }
            ) : SizedBox(),
          ],
        ),
      ),
      actions: [
        ElevatedButton(onPressed: (){}, child: Text("delete")),
        ElevatedButton(onPressed: (){}, child: Text("save"))
      ],
    );
  }

  void showEditDeletePopup(Goal goal, BuildContext context) {
    if (goal != null) {
      currentSliderValue = goalsList.length - goal.priority! - 1;
      print("TEST: $currentSliderValue / ${goalsList.length - 1}");
      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, SetState) {
              return editOrDeleteGoalDialog(goal, context);
            }
        ),
        barrierDismissible: true,
      );
    }
  }

  Goal checkIfGoalExists(int value) {
    if (value == 0) {
      return Goal();
    } else if (goalsList.length >= value){
      return goalsList[value - 1];
    } else {
    return Goal();
    }
  }


  bool showFourthGoal = true;
  int selectedPriorityValue = 0;
  List<Goal> goalsList = [];
  Size deviceSize = Size.zero;
  double currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    deviceSize = MediaQuery.of(context).size;

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
          SizedBox(height: deviceSize.height / 22),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GoalTile(context: context,
                  goal: checkIfGoalExists(1),
                  onTap: () => showEditDeletePopup(checkIfGoalExists(1), context),
              ),
              GoalTile(context: context,
                goal: checkIfGoalExists(2),
                  onTap: () => showEditDeletePopup(checkIfGoalExists(2), context),
              ),
              GoalTile(context: context,
                  goal: checkIfGoalExists(3),
                  onTap: () => showEditDeletePopup(checkIfGoalExists(3), context),
              ),
              showFourthGoal ?
              GoalTile(context: context,
                goal: checkIfGoalExists(4),
                onTap: () => showEditDeletePopup(checkIfGoalExists(4), context),
              ): SizedBox(),
            ],
          ),
          SizedBox(height: deviceSize.height / 15),
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

