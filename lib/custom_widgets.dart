import 'package:flutter/material.dart';
import 'package:personal_project/classes.dart';
import 'package:personal_project/custom_styles.dart';

Widget AddGoalBottomBar({required Function onPressed, required BuildContext context}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  Size deviceSize = MediaQuery.of(context).size;

  TextEditingController newGoalController = TextEditingController();
  FocusNode newGoalFocusNode = FocusNode();

  return Container(
    height: deviceSize.height * .45,
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
          autofocus: false,
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
        child: Text("add"), //todo - label
      ),
    ]),
  );
}

///The 3 (or 4) main boxes
Widget GoalTile({required BuildContext context, required Goal goal, required Function onTap}) {
  Color borderColor = Color(0xFF010101);
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
            color: borderColor,
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
    padding = EdgeInsetsDirectional.fromSTEB(30, 12, 30, 12);
  } else if (goal.priority == 1) {
    borderColor = Color(0xFFD3BB65);
    padding = EdgeInsetsDirectional.fromSTEB(40, 12, 40, 12);
  } else if (goal.priority == 2) {
    borderColor = Color(0xFFA9A579);
    padding = EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12);
  }

  return Opacity(
    opacity: opacity,
    child: Padding(
      padding: padding,
      child: InkWell(
        onTap: () => onTap(),
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
}
