import 'package:flutter/material.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 100,
        color: Colors.blueGrey,
        child: Text('User Settings'),
        
      ),
    );
  }
}