import 'package:flutter/material.dart';

InputDecoration getInputDecoration({String lebel, Widget icons}) {
  if(icons == null)
    return InputDecoration(
      labelText: lebel,
      labelStyle: TextStyle(color: AppColors.two),
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(55.0),
        borderSide: new BorderSide(color: AppColors.one,width: 4),
      ),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(5.0),
        borderSide: new BorderSide(width: 4),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(15.0),
        borderSide: new BorderSide(color: AppColors.two,width: 4),
      ),
    );
  else 
    return InputDecoration(
      labelText: lebel,
      labelStyle: TextStyle(color: AppColors.two),
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(55.0),
        borderSide: new BorderSide(color: AppColors.one,width: 4),
      ),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(5.0),
        borderSide: new BorderSide(width: 4),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(15.0),
        borderSide: new BorderSide(color: AppColors.two,width: 4),
      ),
      suffixIcon: icons,
    );
}

ThemeData getThemeData() {
  return ThemeData(
    primaryColor: AppColors.two,
    canvasColor: Colors.white,
  );
}


MaterialColor createSwatch(int r, int g, int b, double o){
	Map<int, Color> swatch = {};
	List<int> opacities = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
	for(int opacity in opacities)
		swatch[opacity] = Color.fromRGBO(r, g, b, opacity/1000);
	return MaterialColor(
		Color.fromRGBO(r, g, b, o).value,
		swatch
	);
}

class AppColors{
	static final MaterialColor one = createSwatch(210, 158, 218, 1);
  static final MaterialColor two = createSwatch(156, 156, 218, 1);
  static final MaterialColor three = createSwatch(97, 192, 192, 1);
  static final MaterialColor four = createSwatch(146, 218, 181, 1);
  static final MaterialColor five = createSwatch(199, 224, 149, 1);
}