; Color {char r, g, b, a} -> passed on a register
; Vector2 {x, y: float}

; 20
; typedef struct Texture {
;     unsigned int id;        // OpenGL texture id
;     int width;              // Texture base width
;     int height;             // Texture base height
;     int mipmaps;            // Mipmap levels, 1 by default
;     int format;             // Data format (PixelFormat type)
; } Texture;

; 48
; typedef struct Font {
;     int baseSize;           // Base size (default chars height)
;     int glyphCount;         // Number of glyph characters
;     int glyphPadding;       // Padding around the glyph characters
;     Texture2D texture;      // Texture atlas containing the glyphs
;     Rectangle *recs;        // Rectangles in texture for the glyphs
;     GlyphInfo *glyphs;      // Glyphs info data
; } Font;

extrn InitWindow ; void(int width, int height, char const *title)
extrn CloseWindow
extrn WindowShouldClose
extrn BeginDrawing
extrn EndDrawing
extrn ClearBackground ; void(Color color)
extrn DrawRectangle ; void(int posx, int posy, int width, int height, Color color)
extrn LoadFont ; Font(const char *fileName)
extrn LoadFontEx ; Font(const char *fileName, int fontSize, int *codepoints, int codepointCount)
extrn UnloadFont ; void(Font font)
extrn DrawText ; void(char const *text, int posx, int posy, int font_size, Color color)
extrn DrawTextEx; void(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint)
extrn MeasureText ; void(char const *text, int font_size)
