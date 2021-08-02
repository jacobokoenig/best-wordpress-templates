part of 'constants.dart';

const Color black = Color(0xFF0A171B);
const Color lightGray = Color(0xFFF6F5F3);
const Color purple = Color(0xFF9B51DF);
const Color blue = Color(0xFF2879A7);
const Color white = Colors.white;
const Color green = Color(0xFF0B843E);
const Color orange = Color(0xFFEA5329);

Color colorFromString(String? str) {
  if (str == null) return Colors.yellow;
  switch (str) {
    case 'black':
      return black;
    case 'lightGray':
      return lightGray;
    case 'purple':
      return purple;
    case 'blue':
      return blue;
    case 'white':
      return white;
    case 'green':
      return green;
    default:
      return Colors.yellow;
  }
}
