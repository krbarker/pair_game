import 'dart:async';

import 'streamed_value.dart';


///
class Utils {
  static String lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi feugiat quis massa at tincidunt. Proin lacus sapien, ullamcorper sed diam a, varius ornare ligula. Maecenas vitae velit ac orci lacinia convallis in vel nisl. Mauris lacinia, nisi ut porttitor finibus, metus est mattis metus, in laoreet metus lacus nec risus. Nunc porttitor lorem ac interdum imperdiet. Mauris finibus ante ex, ac pellentesque ante lacinia quis. In in maximus lacus. Duis fringilla nulla sem, eget elementum tellus tincidunt id. Nunc at ante id turpis consequat feugiat. Aliquam consequat, ipsum sit amet ullamcorper posuere, leo lectus tincidunt sapien, in feugiat neque nisi feugiat elit. Nulla porta eget libero vel accumsan. Integer cursus ipsum id ultrices faucibus. Nam vel ex tempor, cursus dui vel, auctor augue. Vestibulum viverra lectus at quam bibendum sagittis. Phasellus gravida suscipit nisi vulputate tempor. Proin vitae ultricies nulla.";
  static String loremLight =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi feugiat quis massa at tincidunt. Proin lacus sapien, ullamcorper sed diam a, varius ornare ligula. Maecenas vitae velit ac orci lacinia convallis in vel nisl. Mauris lacinia, nisi ut porttitor finibus, metus est mattis metus, in laoreet metus lacus nec risus. ";

  static Timer sendText(String text, StreamedValue stream, int milliseconds,
      [int duration]) {
    int index = 0;
    Timer timer;

    int refresh =
        duration != null ? (duration ~/ text.length).toInt() : milliseconds;

    timer = Timer.periodic(Duration(milliseconds: refresh), (Timer t) {
      if (index <= text.length - 1) {
        var toShow = text.substring(0, index + 1);
        stream.value = toShow;
        //print(toShow);
        //print(refresh);
        index++;
      } else {
        timer.cancel();
      }
    });
    return timer;
  }

  static Timer sendTextTo(
      Timer timer, String text, int milliseconds, Function(String) callback) {
    int index = 0;
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds: milliseconds), (Timer t) {
      if (index <= text.length - 1) {
        var toShow = text.substring(0, index + 1);
        //stream.value = toShow;
       // print(toShow);
        callback(toShow);
        index++;
      } else {
        timer.cancel();
      }
    });
    return timer;
  }
}
