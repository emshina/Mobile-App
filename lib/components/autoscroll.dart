import 'package:flutter/cupertino.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class ScrollCont extends StatefulWidget {
  const ScrollCont({super.key});

  @override
  State<ScrollCont> createState() => _ScrollContState();
}

class _ScrollContState extends State<ScrollCont> {
  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      duration: Duration(minutes: 5),
      // scrollSpeed: Duration(seconds: 1),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage('assets/images/car.jpg'),
                    fit: BoxFit.cover)
                // image:
                ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage('assets/images/car.jpg'),
                    fit: BoxFit.cover)
                // image:
                ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage('assets/images/car.jpg'),
                    fit: BoxFit.cover)
                // image:
                ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage('assets/images/car.jpg'),
                    fit: BoxFit.cover)
                // image:
                ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
