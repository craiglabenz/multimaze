/// Specifies a location on the game board as an (X,Y) distance from the origin.
///
/// Although graphics draw from the upper-left of a screen, visualizing a game
/// board is more intuitive treating the bottom-left as the origin. Thus, these
/// coordinates assume the bottom-left square is (0,0).
///
/// Note that *squares* are valid game locations, not lines, so a game board of
/// size 10x10 will have valid coordinates ranging from (0,0) to (9,9).
class Coordinates {
  const Coordinates({required this.x, required this.y});
  final int x;
  final int y;
}
