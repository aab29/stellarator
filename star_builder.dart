import "dart:html";
import "dart:math";

class StarBuilder {
  CanvasElement canvas;
  CanvasRenderingContext2D context;

  InputElement armsSlider = querySelector("#arms_slider");
  InputElement innerRadiusSlider = querySelector("#inner_radius_slider");
  InputElement outerRadiusSlider = querySelector("#outer_radius_slider");

  double canvasSize;
  double centerX;
  double centerY;

  int armsCount;
  double innerRadius;
  double outerRadius;

  StarBuilder(this.canvas, this.context) {
    canvasSize = canvas.width.toDouble();
    centerX = canvasSize * 0.5;
    centerY = canvasSize * 0.5;

    armsSlider.onChange.listen((_) => drawStar());
    innerRadiusSlider.onChange.listen((_) => drawStar());
    outerRadiusSlider.onChange.listen((_) => drawStar());

    drawStar();
  }

  void drawStar() {
    updateStarAttributes();

    context
      ..clearRect(0, 0, canvasSize, canvasSize)
      ..setFillColorRgb(255, 228, 0)
      ..setStrokeColorRgb(173, 72, 0)
      ..beginPath()
      ..moveTo(centerX + innerRadius, centerY);

    for (var armIndex = 0; armIndex < armsCount; armIndex++) {
      var angleToOuterPoint = ((armIndex + 0.5) / armsCount) * pi * 2.0;
      var angleToInnerPoint = ((armIndex + 1.0) / armsCount) * pi * 2.0;

      context
        ..lineTo(centerX + cos(angleToOuterPoint) * outerRadius,
            centerY + sin(angleToOuterPoint) * outerRadius)
        ..lineTo(centerX + cos(angleToInnerPoint) * innerRadius,
            centerY + sin(angleToInnerPoint) * innerRadius);
    }

    context
      ..fill()
      ..stroke();
  }

  void updateStarAttributes() {
    armsCount = armsSlider.valueAsNumber;
    innerRadius = innerRadiusSlider.valueAsNumber * 0.5 * canvasSize;
    outerRadius = outerRadiusSlider.valueAsNumber * 0.5 * canvasSize;
  }
}
