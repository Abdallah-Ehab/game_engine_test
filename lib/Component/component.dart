// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/Entity/data/entity.dart';

abstract class Component with ChangeNotifier{

  bool isActive;
  Component(
    {this.isActive = true}
  );
  void update(Duration dt,{required Entity activeEntity});
  void toggleComponent(){
    isActive = !isActive;
    notifyListeners();
  }
}
