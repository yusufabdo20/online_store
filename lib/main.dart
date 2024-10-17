import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/online_store.dart';

import 'core/bloc_observer/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const OnlineStore());
}
