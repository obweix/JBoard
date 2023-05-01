import 'package:flutter/services.dart';
import 'index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JBoard',
      onGenerateRoute: Routes.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'JBoard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _text = "";

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.grey[300]?.withOpacity(0.5),borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  onChanged: (newText){
                    _text = newText;
                  },
                  controller: _textEditingController,
                  decoration: const InputDecoration(hintText: '输入文字，然后点击下方按钮',border: InputBorder.none),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(Routes.pageNormalBoard,arguments: _text),
                    child: const Text('开始展示')),
              ),
              // Container(
              //   width: double.infinity,
              //   height: 50,
              //   margin: const EdgeInsets.all(10),
              //   child: ElevatedButton(
              //       onPressed: () =>
              //           Navigator.of(context).pushNamed(Routes.pageJBoard,arguments: _text),
              //       child: const Text('铁山靠模式')),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
