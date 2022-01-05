import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _testeDoBang() async {
    final wifis = await WiFiForIoTPlugin.loadWifiList();
    wifis.map((e) => print(e.ssid)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            //This part is related to the tabs added under the AppBar, which has the Home Icon and List Icon relatively
            bottom: const TabBar(
              indicatorColor: Colors.black87,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Devices',
                )
              ],
            ),

            toolbarOpacity: 0.7,
            toolbarTextStyle: const TextStyle(fontStyle: FontStyle.normal),
            title: Text(widget.title),
            backgroundColor: Colors.black,
            elevation: 20,
            titleSpacing: 20,

            leading: IconButton(
              iconSize: 36,
              icon: const Icon(Icons.help),
              onPressed: () => {print('Bangdo pai')},
            ),

            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.blueGrey],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft)),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _testeDoBang,
            tooltip: 'Increment',
            child: const Icon(Icons.wifi),
            backgroundColor: Colors.black,
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
