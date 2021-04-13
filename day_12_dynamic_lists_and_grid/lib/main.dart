import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _users = List.filled(20, 'Ruhit Arman');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text('List'),
                Text('Grid'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _contentListView(),
              _contentGridView(),
          ],
          ),
        ),
      ),
    );
  }

  Widget _contentListView(){
    return ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_users[index]),
              onTap: ()=> print("Hello $index"),
            ),
          );
        }
    );
  }
  
  Widget _contentGridView(){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: _users.length,
        itemBuilder: (context, index){
          return Card(
            child: Center(
              child: GridTile(
                  child: Text(_users[index])
              ),
            ),
          );
        }
    );
  }

}
