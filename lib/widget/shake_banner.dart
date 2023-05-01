import 'package:j_board/index.dart';
import 'dart:math' as math;

class ShakeBanner extends StatefulWidget {
  const ShakeBanner({Key? key,required this.child}) : super(key: key);

  final Widget child;

  @override
  State<ShakeBanner> createState() => _ShakeBannerState();
}

class _ShakeBannerState extends State<ShakeBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.repeat(period: const Duration(milliseconds: 500),reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShakeBannerTransition(value: _controller, child: widget.child);
  }
}

class ShakeBannerTransition extends AnimatedWidget {
  final Widget child;

  Animation<double> get value =>listenable as Animation<double>;

  const ShakeBannerTransition(
      {Key? key, required this.child, required Animation<double> value})
      : super(key: key, listenable: value);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomMultiChildLayout(
        delegate: ShakeBannerLayout(animatedValue: value.value),
        children: [
          LayoutId(id: 0, child: Row(children: [child])),
        ],
      ),
    );
  }
}

class ShakeBannerLayout extends MultiChildLayoutDelegate{
  final double animatedValue;

  ShakeBannerLayout({required this.animatedValue});

  @override
  void performLayout(Size size) {
    if(hasChild(0)){
      double base = 1.5;

      final childSize =  layoutChild(0, BoxConstraints.loose(Size(double.infinity,size.height)));
      double x = size.width * animatedValue - childSize.width;
      // if(x < base){
      //   positionChild(0,Offset.zero);
      //   return;
      // }

      if(x < 0){
          positionChild(0,Offset.zero);
          return;
      }



      double y = math.log(x) / math.log(base);
      positionChild(0,Offset(x,-y * 20));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }

}



