import 'package:flutter/material.dart';

class SearchByBuildingFailed extends StatelessWidget {
  const SearchByBuildingFailed({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buildings'),
      ),
      body: Center(
        child: Text("No connection to server.."),
      ),
    );
  }

}