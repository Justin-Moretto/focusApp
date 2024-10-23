import 'package:flutter/material.dart';
import 'package:personal_project/classes.dart';
import 'package:personal_project/custom_styles.dart';
import 'package:personal_project/custom_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  AlertDialog editOrDeleteGoalDialog(Goal goal, BuildContext context) {
    TextEditingController goalController = TextEditingController(text: goal.text);

    return AlertDialog(
      title: Text("Delete or edit"),
      backgroundColor:  Theme.of(context).colorScheme.secondary,
      content: SizedBox(
        height: deviceSize.height / 5,
        child: Column(
          children: [
            TextField(
              controller: goalController, // Set the controller to the TextField
              decoration: InputDecoration(
                hintText: "Edit goal",
                hintStyle: TextStyle(color: Colors.white54), // Optional: styling
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white), // Optional: styling
            ),
            goalsList.length > 1 ? StatefulBuilder(
              builder: (context, SetState) {
                return Column(
                  children: [
                    Slider(
                        value: currentSliderValue,
                        min: 0,
                        max: goalsList.length - 1,
                        divisions: goalsList.length - 1,
                        onChanged: (newValue) {
                          SetState((){
                            currentSliderValue = newValue;
                          });
                        }),
                    Row(
                      children: [
                        Text("Rank "),
                        Text("${(goalsList.length - currentSliderValue).toInt()}"),
                        Text(" of ${goalsList.length}")
                      ],
                    )
                  ],
                );
              }
            ) : SizedBox(),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                  goalsList.removeAt(selectedGoalCurrentListIndex);
                  goalsList.asMap().forEach((index, goal) {
                    goal.priority = index;
                  });
                  goalsList.sort((a, b) => a.priority!.compareTo(b.priority!));
              });
              Navigator.of(context).pop();
            },
            child: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error
            )
        ),
        ElevatedButton(
            onPressed: () {
              String updatedGoalText = goalController.text;
              int updatedPriority = convertSliderValueForPriority(currentSliderValue);
              setState(() {
                goal.text = updatedGoalText;
                if (selectedGoalCurrentListIndex != updatedPriority) {
                  goalsList.removeAt(selectedGoalCurrentListIndex);
                  goalsList.insert(updatedPriority, goal);
                  goalsList.asMap().forEach((index, goal) {
                    goal.priority = index;
                  });
                  goalsList.sort((a, b) => a.priority!.compareTo(b.priority!));
                }
              });
              Navigator.of(context).pop();
            },
            child: Icon(Icons.save))
      ],
    );
  }

  double convertPriorityForSliderValue(Goal goal) {
    return goalsList.length - goal.priority! - 1;
  }

  int convertSliderValueForPriority(double sliderValue) {
    return goalsList.length - 1 - sliderValue.toInt();
  }

  void showEditDeletePopup(Goal goal, BuildContext context) {
    if (goal != null) {
      selectedGoalCurrentListIndex = goal.priority!;
      currentSliderValue = convertPriorityForSliderValue(goal);
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

  Column defaultView() {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: deviceSize.height / 30, width: deviceSize.width - 1),
        goalsList.length > 0 ?
        Expanded(
          child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                // These two lines are workarounds for ReorderableListView problems
                if (newIndex > goalsList.length) newIndex = goalsList.length;
                if (oldIndex < newIndex) newIndex--;

                if (oldIndex != newIndex) {
                  Goal goalBeingReordered = goalsList[oldIndex];

                  goalsList.removeAt(oldIndex);
                  goalsList.insert(newIndex, goalBeingReordered);
                  goalsList.asMap().forEach((index, goal) {
                    goal.priority = index;
                  });
                  goalsList.sort((a, b) => a.priority!.compareTo(b.priority!));
                }
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            itemCount: goalsList.length > 4 ? 4 : goalsList.length, //display max 4
            itemBuilder: (context, index) {
              if (index < 5) {
                return GoalTile(
                  key: ValueKey(goalsList[index]),
                  isEdit: false,
                  context: context,
                  goal: goalsList[index],
                  onTap: () => showEditDeletePopup(goalsList[index], context),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ): Text("enter something", key: ValueKey("txt")), //todo - better text widget here
        Padding(
          padding: EdgeInsets.only(bottom: deviceSize.height / 16),
          child: Container(
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
                    isScrollControlled: true,
                    builder: (context) {
                      return AddGoalBottomBar(
                        onPressed: addGoal,
                        context: context,
                      );
                    },
                  );
                }
            ),
          ),
        ),
      ],
    );
  }

  Column editView() {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: deviceSize.height / 30, width: deviceSize.width - 1),
        Expanded(
          child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                // These two lines are workarounds for ReorderableListView problems
                if (newIndex > goalsList.length) newIndex = goalsList.length;
                if (oldIndex < newIndex) newIndex--;

                if (oldIndex != newIndex) {
                  Goal goalBeingReordered = goalsList[oldIndex];

                  goalsList.removeAt(oldIndex);
                  goalsList.insert(newIndex, goalBeingReordered);
                  goalsList.asMap().forEach((index, goal) {
                    goal.priority = index;
                  });
                  goalsList.sort((a, b) => a.priority!.compareTo(b.priority!));
                }
              });
            },
            itemCount: goalsList.length,
            itemBuilder: (context, index) {
                return GoalTile(
                  key: ValueKey(goalsList[index]),
                  isEdit: true,
                  context: context,
                  goal: goalsList[index],
                  onTap: () => showEditDeletePopup(goalsList[index], context),
                );
            },
          ),
        ),
      ],
    );
  }

  bool isEditMode = false;
  bool showFourthGoal = true;

  List<Goal> goalsList = [];
  int selectedGoalCurrentListIndex = 0;
  double currentSliderValue = 0;

  Size deviceSize = Size.zero;
  ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: const Color(0xFFC98F2A),
    onPrimary: Colors.white,
    secondary: const Color(0xFF403C38),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: const Color(0xFF272727),
    onSurface: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    colorScheme = Theme.of(context).colorScheme;
    deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: colorScheme.secondary,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.edit_note,
            color: colorScheme.primary,
            size: 40,
          ),
          onPressed: () => toggleEditMode(),
        ),
        title: Text(
          'F o ( u s',
          style: textStyleColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('IconButton pressed ...'); //todo - add options
            },
            icon: Icon(
                Icons.settings_sharp,
                color: colorScheme.primary
            ),
          ),
        ],
        centerTitle: true,
        elevation: 30,
      ),
      body: Column(
        children: [
          Expanded(
            child: isEditMode ? editView() : defaultView(),
          ),
        ],
      ),
    );
  }
}

