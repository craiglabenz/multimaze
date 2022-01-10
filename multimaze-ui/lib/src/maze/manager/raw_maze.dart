/// String representation of a Maze.
///
/// Each string in the list is a row of squares in the maze. Each character in
/// each string represents that row's tile for the given column.
///
/// All strings must be of equal length, as will be validated by `MazeManager`.
///
/// The valid characters are:
///   * space - empty square
///   * astericks - an impassible wall
///   * @ - the player's starting location
///   * x - the target location / victory square (X marks the spot :))
final List<String> rawMaze = [
  "**********x***********",
  "******     *          ",
  "*          *     **   ",
  "*       ***********  *",
  "*  **** *    *    *  *",
  "*  *  ***    *       *",
  "*  *      *  ***  ****",
  "*  *****  *  ***  ****",
  "*         *           ",
  "*         *          @",
  "**********************",
];
