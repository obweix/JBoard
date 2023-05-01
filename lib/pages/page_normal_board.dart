import 'package:j_board/index.dart';

import '../widget/Marquee.dart';

class PageNormalBoard extends StatefulWidget {
  const PageNormalBoard({Key? key,required this.text}) : super(key: key);

  final String text;

  @override
  State<PageNormalBoard> createState() => _PageNormalBoardState();
}

class _PageNormalBoardState extends State<PageNormalBoard> {
  @override
  Widget build(BuildContext context) {
    print(widget.text);
    String showedText ='';
    for(int i=0;i<50;++i){
      showedText += "  ";
      showedText += widget.text;
    }
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Marquee(
          child: Center(
            child: Text(
              showedText,
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: const TextStyle(fontSize: 120,color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
