import 'package:flutter/material.dart';
import 'package:personal_project/classes.dart';
import 'package:personal_project/custom_styles.dart';

Widget AddGoalBottomBar({required Function onPressed, required BuildContext context}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  Size deviceSize = MediaQuery.of(context).size;

  TextEditingController newGoalController = TextEditingController();
  FocusNode newGoalFocusNode = FocusNode();

  return Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: Container(
      height: deviceSize.height * .40,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: deviceSize.height / 55),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add goal:', style: textStyleColor),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  size: 34,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: deviceSize.height / 55),
        Container(
          width: deviceSize.width * 0.85,
          child: TextFormField(
            controller: newGoalController,
            focusNode: newGoalFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: colorScheme.surface,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC46E11), width: 2),
                borderRadius: BorderRadius.circular(22),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC46E11), width: 2),
                borderRadius: BorderRadius.circular(22),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.error, width: 2),
                borderRadius: BorderRadius.circular(22),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.error, width: 2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            maxLines: 4,
            cursorColor: colorScheme.primary,
            // validator: textControllerValidator.asValidator(context), //todo validator
          ),
        ),
        SizedBox(
          height: deviceSize.height / 55,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.secondary,
          ),
          onPressed: () {
            onPressed(newGoalController.text);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("add", style: TextStyle(fontSize: 30)),
          ),
        ),
      ]),
    ),
  );
}

///The 3 (or 4) main boxes
Widget GoalTile({required BuildContext context, required Goal goal, required Function onTap, required bool isEdit, key}) {
  Color borderColor = Color(0xFF010101);
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  Color backgroundColor = Theme.of(context).colorScheme.secondary;
  EdgeInsetsDirectional padding = EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12);

  if (goal.priority == null) {
    return Padding(
      padding: padding,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black26,
              offset: Offset(0, 2),
              spreadRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: colorScheme.error,
            width: 7,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            "ENTER",
            style: textStyleWhite,
          ),
        ),
      ),
    );
  }

  double opacity = goal.priority! > 2 ? 0.25 : 1;

  if (goal.priority == 0) {
    borderColor = Color(0xFFFFCA03);
    backgroundColor = Color.lerp(backgroundColor, Colors.orange, 0.6)!;
    padding = EdgeInsetsDirectional.fromSTEB(30, 12, 30, 12);
  } else if (goal.priority == 1) {
    borderColor = Color(0xFFD3BB65);
    backgroundColor = Color.lerp(backgroundColor,  Colors.orange, 0.3)!;
    padding = EdgeInsetsDirectional.fromSTEB(40, 12, 40, 12);
  } else if (goal.priority == 2) {
    borderColor = Color(0xFFA9A579);
    backgroundColor = Color.lerp(backgroundColor,  Colors.orange, 0.1)!;
    padding = EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12);
  }

  if (isEdit == false) {
    return Opacity(
      key: key,
      opacity: opacity,
      child: Padding(
        padding: padding,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  spreadRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: borderColor,
                width: 7,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Text(
                goal.text!,
                style: textStyleWhite,
              ),
            ),
          ),
        ),
      ),
    );
  } else { //edit mode
    return Padding(
      key: key,
      padding: padding,
      child: InkWell(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Container(
                width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        spreadRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white54,
                      width: 7,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      "${goal.priority! + 1}",
                      style: textStyleBlack,
                    ),
                  ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      spreadRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white54,
                    width: 7,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    goal.text!,
                    style: textStyleWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
