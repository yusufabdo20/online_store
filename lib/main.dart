import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/locator/locator.dart';
import 'package:online_store/online_store.dart';

import 'core/bloc_observer/bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
locator() ;
  runApp(const OnlineStore());
}
