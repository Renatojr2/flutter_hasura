import 'package:flutter/material.dart';
import 'package:hasura/pages/home/repository/home_repository_implemetation.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final repository = HomeRepositoryImplematation();
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Future',
            ),
            Tab(
              text: 'Steam',
            ),
          ]),
        ),
        body: TabBarView(children: [
          FutureBuilder<List<Map>>(
            future: repository.getRepository(),
            builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            } else if (snapshot.hasData) {
              final list = snapshot.data;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(list[index]['name']),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          StreamBuilder<List<Map>>(
            stream: repository.getStreamRepository(),
            
            builder: (context, snapshot) {
            
            if (snapshot.hasError) {
              return Text('Error');
            } else if (snapshot.hasData) {
              final list = snapshot.data;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(list[index]['name']),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ]),
      ),
    );
  }
}
