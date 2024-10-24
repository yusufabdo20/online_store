import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/styles/theme/cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
children: [
Row(children:[
  Switch(value: BlocProvider.of<ThemeCubit>(context).state == ThemeMode.dark, onChanged:(bool newValue){
    print(newValue);
    BlocProvider.of<ThemeCubit>(context).changeTheme() ; 
  } ) , 

  Text("Dark Mode")

])
],
    ));
  }
}