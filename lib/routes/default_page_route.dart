import 'package:flutter/material.dart';

class DefaultPageRoute<T> extends MaterialPageRoute<T> {
  DefaultPageRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    return SlideTransition(position: 
      Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation), child: child);
  }
}