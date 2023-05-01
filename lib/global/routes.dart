import 'package:j_board/index.dart';
import 'package:j_board/pages/page_j_board.dart';
import 'package:j_board/pages/page_normal_board.dart';

class Routes {
  static const String pageNormalBoard = "pageNormalBoard";
  static const String pageJBoard = "pageJBoard";


  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pageNormalBoard:
        return MaterialPageRoute(builder: (_) => PageNormalBoard(text: settings.arguments as String,));

      case pageJBoard:
        return MaterialPageRoute(builder: (_) => PageJBoard(text: settings.arguments as String,));

      default:
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text("undefine route name."),),);
    }
  }
}

