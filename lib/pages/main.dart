import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272727),
      appBar: AppBar(
        backgroundColor: Color(0xFF464542),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
          child: IconButton(
            // borderRadius: 8,
            // buttonSize: 44,
            icon: Icon(
              Icons.edit,
              color: Color(0xFFC98F2A),
              size: 40,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: Text(
            'F o ( u s',
            // style: FlutterFlowTheme.of(context).bodyMedium.override(
            //   fontFamily: 'Readex Pro',
            //   color: Color(0xFFC98F2A),
            //   fontSize: 32,
            //   letterSpacing: 0.0,
            // ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () {
                print('IconButton pressed ...');
              },
              child: Icon(
                  Icons.settings_sharp,
                  color: Color(0xFFC98F2A),
                  size: 32),
              style: ButtonStyle(
                // borderRadius: 8,
                // buttonSize: 40,
                // fillColor: Color(0x004B39EF),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 30,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 60),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 12, 30, 12),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF403C38),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                          spreadRadius: 5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xFFFFCA03),
                        width: 7,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Priority 1',
                        // style: Theme.of(context).labelLarge.override(
                        //   fontFamily: 'Readex Pro',
                        //   color: Colors.white,
                        //   fontSize: 32,
                        //   letterSpacing: 0.0,
                        //   fontWeight: FontWeight.w500,
                        // ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 12, 40, 12),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF403C38),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                          spreadRadius: 5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xFFD3BB65),
                        width: 7,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Priority 2',
                        // style: FlutterFlowTheme.of(context).labelLarge.override(
                        //   fontFamily: 'Readex Pro',
                        //   color: Color(0xFFDCDCDC),
                        //   fontSize: 32,
                        //   letterSpacing: 0.0,
                        //   fontWeight: FontWeight.w500,
                        // ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF403C38),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                          spreadRadius: 5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xFFA9A579),
                        width: 7,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Priority 3',
                        // style: FlutterFlowTheme.of(context).labelLarge.override(
                        //   fontFamily: 'Readex Pro',
                        //   color: Color(0xFFAEAAA6),
                        //   fontSize: 32,
                        //   letterSpacing: 0.0,
                        //   fontWeight: FontWeight.w500,
                        // ),
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.25,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 12, 50, 12),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF403C38),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              2,
                            ),
                            spreadRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Color(0xFF010101),
                          width: 7,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Priority 4',
                          //style:
                          // FlutterFlowTheme.of(context).labelLarge.override(
                          //   fontFamily: 'Readex Pro',
                          //   color: Colors.black,
                          //   fontSize: 32,
                          //   letterSpacing: 0.0,
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: IconButton(
              // borderColor: Color(0xFFC98F2A),
              // borderRadius: 30,
              // borderWidth: 6,
              // buttonSize: 80,
              // fillColor: Color(0x00FFFFFF),
              icon: Icon(
                Icons.add,
                color: Color(0xFFC98F2A),
                size: 60,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Padding(
                        // padding: MediaQuery.viewInsetsOf(context),
                        // child: AddTaskWidget(),
                      ),
                    );
                  },
                ); //.then((value) => safeSetState(() {}));
              },
            ),
          ),
        ],
      ),
    );
  }
}