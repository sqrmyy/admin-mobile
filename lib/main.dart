import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: AdminMobilePage(),
    );
  }
}

class AdminMobilePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigation(),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PostList(),
          ),
        ],
      ),
    );
  }
}

class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.thumbs_up_down),
          label: Text('ThumbsUpDown'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('People'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.face),
          label: Text('Face'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark),
          label: Text('Bookmark'),
        ),
      ],
    );
  }
}

class _PostsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                color: Colors.grey[300],
                width: 48,
                height: 48,
                child: Icon(
                  Icons.storage,
                  color: Colors.grey[800],
                ),
              ),
            ),
            title: Text('Posts'),
            subtitle: Text('20 Posts'),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                color: Colors.grey[300],
                width: 48,
                height: 48,
                child: Icon(
                  Icons.style,
                  color: Colors.grey[800],
                ),
              ),
            ),
            title: Text('All Types'),
            subtitle: Text(''),
          ),
        ),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String textNegative;

  const _Post({
    Key? key,
    required this.name,
    required this.message,
    required this.textReason,
    required this.colorPrimary,
    required this.colorPositive,
    required this.textPositive,
    required this.colorNegative,
    required this.textNegative,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      name.substring(0, 1),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              title: Text(name),
              subtitle: Text('2 min ago'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorPrimary, width: 2),
                      ),
                    ),
                    child: Text(
                      textReason,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorNegative,
                      ),
                      onPressed: () {},
                      child: Text(textNegative),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorPositive,
                        backgroundColor: colorPositive.withOpacity(0.2),
                      ),
                      onPressed: () {},
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'Pean',
      message: 'Weak reason. No action required.',
      textReason: 'Report Details',
      colorPrimary: Colors.greenAccent,
      colorPositive: Colors.greenAccent,
      textPositive: 'Keep',
      colorNegative: Colors.blueAccent,
      textNegative: 'Archive',
    );
  }
}

class _PostRed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'Namaga Tema',
      message: 'Not recomended for publication.',
      textReason: 'Pending Reason',
      colorPrimary: Colors.deepOrangeAccent,
      colorPositive: Colors.blueAccent,
      textPositive: 'Publish',
      colorNegative: Colors.deepOrangeAccent,
      textNegative: 'Decline',
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _PostsHeader(),
          Expanded(
            child: ListView(
              children: [
                _PostGreen(),
                _PostRed(),
                _PostGreen(),
                _PostRed(),
                _PostGreen(),
                _PostRed(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
