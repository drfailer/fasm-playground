; Color {char r, g, b, a} -> passed on a register

extrn InitWindow ; void(int width, int height, char const *title)
extrn CloseWindow
extrn WindowShouldClose
extrn BeginDrawing
extrn EndDrawing
extrn ClearBackground ; void(Color color)
extrn DrawRectangle ; void(int posx, int posy, int width, int height, Color color)
extrn DrawText ; void(char const *text, int posx, int posy, int font_size, Color color)
extrn MeasureText ; void(char const *text, int font_size)
