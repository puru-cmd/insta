import 'package:flutter/material.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';
import 'navbar.dart';
import 'chatbox.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings ){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => const FirstPage());
      case '/second':
        if(args is String) {
          return MaterialPageRoute(builder: (_) => const SecondPage(),
          );
        }
        return _errorRoute();
      case '/third':
        if(args is String){
          return MaterialPageRoute(builder: (_) => const ThirdPage(),
          );
        }
        return _errorRoute();
      case '/home':
        if(args is String){
          return MaterialPageRoute(builder: (_) => const MyNavBar(),
          );
        }
        return _errorRoute();
      case '/chat':
        if(args is String){
          return MaterialPageRoute(builder: (_) => const ChatPage(),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
}

 Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child:  Text('ERROR'),
      ),
    );
  });
}
