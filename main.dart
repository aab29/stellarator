import "dart:html";

import "canvas_tools.dart";
import "star_builder.dart";

void main() {
  var canvas = CanvasTools.configureSquareCanvas();
  var context = canvas.getContext("2d") as CanvasRenderingContext2D;

  new StarBuilder(canvas, context);
}
