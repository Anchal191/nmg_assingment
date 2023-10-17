import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/Bloc/bloc.dart';
import 'UI/homePage.dart';
import 'UI/postDetail.dart';

class Routes {

  static Route? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch(settings.name) {
      case '/home':
        return CupertinoPageRoute<bool>(
            builder: (context) => BlocProvider(
              create: (context) => UserListBloc(),
              child: HomePageScreen(),
            )
        );

      case '/postdetail':
        Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute<bool>(
            builder: (context) => BlocProvider(
              create: (context) => UserListBloc(),
              child: PostDetailScreen(arguments['id']),
            )
        );
    }}}