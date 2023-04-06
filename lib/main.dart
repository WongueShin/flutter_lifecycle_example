import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Plugin example app"),
        ),
        body: Center(
          child: FlutterLifecycleTest(),
        ),
      ),
    ),
  );
}

class FlutterLifecycleTest extends StatefulWidget {
  final List<Widget> widgets = [];

  FlutterLifecycleTest({Key? key}) : super(key: key) {
    printIfDebugMode("Widget constructor called");
    widgets.add(_makeCard("Widget constructor called"));
  }

  @override
  // ignore: no_logic_in_create_state
  State<FlutterLifecycleTest> createState() {
    printIfDebugMode("createState called");
    widgets.add(_makeCard("createState called"));
    return _FlutterLifecycleTestState();
  }
}

class _FlutterLifecycleTestState extends State<FlutterLifecycleTest> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    printIfDebugMode("initState");
    widget.widgets.add(_makeCard("initState"));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FlutterLifecycleTest oldWidget) {
    printIfDebugMode("didUpdateWidget");
    widget.widgets.add(_makeCard("didUpdateWidget"));
    super.didUpdateWidget(oldWidget);
  }

  @override
  void setState(VoidCallback fn) {
    printIfDebugMode("setState");
    widget.widgets.add(_makeCard("setState"));
    super.setState(fn);
  }

  @override
  void didChangeDependencies() async {
    printIfDebugMode("didChangeDependencies");
    setState(() {
      widget.widgets.add(_makeCard("didChangeDependencies"));
    });
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    printIfDebugMode("didChangeAppLifecycleState: $state");
    setState(() {
      widget.widgets.add(_makeCard(state.name));
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    printIfDebugMode("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: widget.widgets.length,
              itemBuilder: (_, idx) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(9),
                      color: Color.lerp(
                        Colors.red,
                        Colors.blue,
                        idx / widget.widgets.length,
                      ),
                    ),
                    child: Text(
                      "${idx + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: widget.widgets[idx]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Card _makeCard(String text) {
  return Card(
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      )),
    ),
  );
}

void printIfDebugMode(String text) {
  if (kDebugMode) {
    print(text);
  }
}
