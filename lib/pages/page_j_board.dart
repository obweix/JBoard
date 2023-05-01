import 'package:j_board/index.dart';
import 'package:j_board/widget/shake_banner.dart';

class PageJBoard extends StatefulWidget {
  const PageJBoard({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<PageJBoard> createState() => _PageJBoardState();
}

class _PageJBoardState extends State<PageJBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            width: double.infinity,
            child: const ShakeBanner(
                child: Center(
                    child: Text("只因你太美",
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontSize: 60, color: Colors.red))))));
  }
}
