import 'package:flutter/material.dart';
import 'package:personal_project/custom_styles.dart';

Widget AddGoalBottomBar({required Function onPressed, required BuildContext context}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  Size deviceSize = MediaQuery.of(context).size;

  return Container(
    height: deviceSize.height * .45,
    decoration: BoxDecoration(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(35),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: deviceSize.height/55),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add goal:',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 24,
                  letterSpacing: 0.0,
                  color: colorScheme.primary,
                ),
              ),
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
        SizedBox(height: deviceSize.height/55),
        Container(
          width: deviceSize.width * 0.85,
          child: TextFormField(
            // controller: _model.textController,
            // focusNode: _model.textFieldFocusNode, //todo
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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                ),
                onPressed: () {
                  onPressed("newText"); //todo - get text
                },
                child: Text("add"), //todo - label
              ),
            ),
          ],
        ),
      ]
    ),
  );
}

Widget GoalTile({required BuildContext context, required String text, required int priority}) {
  double opacity = priority > 2 ? 0.25 : 1;
  Color borderColor = Colors.red;
  EdgeInsetsDirectional padding = EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12);

  if (priority == 0) {
    borderColor = Color(0xFFFFCA03);
    padding = EdgeInsetsDirectional.fromSTEB(30, 12, 30, 12);
  } else if (priority == 1)  {
    borderColor = Color(0xFFD3BB65);
    padding = EdgeInsetsDirectional.fromSTEB(40, 12, 40, 12);
  } else if (priority == 2) {
    borderColor = Color(0xFFA9A579);
    padding = EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12);
  } else if (priority >= 3) {
    borderColor = Color(0xFF010101);
    padding = EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12);
  }

  return Opacity(
    opacity: opacity,
    child: Padding(
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
              offset: Offset(0, 2,),
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
            text,
            style: goalTileLabelTextStyle,
          ),
        ),
      ),
    ),
  );
}
