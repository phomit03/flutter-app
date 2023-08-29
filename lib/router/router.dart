
import 'dart:js';

import 'package:appname/pages/main_pages.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> router = {
  MainPage.routerName : (context) => const MainPage(),
};