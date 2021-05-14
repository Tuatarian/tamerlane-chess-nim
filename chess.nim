import raylib, math, rayutils, sequtils, tables

type piece = enum
    NONE, B_KIN, B_VIZ, B_GEN, B_GIR, B_BIS, B_KNI, B_ROK, B_ELE, B_CAM, B_CBW, B_PWN, B_CBPWN, B_CAPWN, B_EPWN, B_GEPWN, B_KIPWN, B_VPWN, B_GIPWN, B_BPWN, B_KNPWN, B_RPWN, W_KIN, W_VIZ, W_GEN, W_GIR, W_BIS, W_KNI, W_ROK, W_ELE, W_CAM, W_CBW, W_PWN, W_CBPWN, W_CAPWN, W_EPWN, W_GEPWN, W_GIPWN, W_KIPWN, W_VPWN, W_CIPWN, W_BPWN, W_KNPWN, W_RPWN


var board : array[10, array[11, piece]]
echo board

board[0] = [B_ELE, NONE, B_CAM, NONE, B_CBW, NONE, B_CBW, NONE, B_CAM, NONE, B_ELE]
board[1] = [B_ROK, B_KNI, B_BIS, B_CAM, B_VIZ, B_KIN, B_GEN, B_CAM, B_BIS, B_KNI, B_ROK]
board[2] = [B_RPWN, B_KNPWN, B_BPWN, B_GIPWN, B_VPWN, B_KIPWN, B_GEPWN, B_EPWN, B_CAPWN, B_CBPWN, B_PWN]

board[7] = [W_PWN, W_CBPWN, W_CAPWN, W_EPWN, W_GEPWN, W_KIPWN, W_VPWN, W_GIPWN, W_BPWN, W_KNPWN, W_RPWN]
board[8] = [W_ROK, W_KNI, W_BIS, W_CAM, W_VIZ, W_KIN, W_GEN, W_CAM, W_BIS, W_KNI, W_ROK]
board[9] = [W_ELE, NONE, W_CAM, NONE, W_CBW, NONE, W_CBW, NONE, W_CAM, NONE, W_ELE]

const
    screenHeight = 1080
    screenWidth = 1920
    tilesize = 96
    boardCol = [WHITE, BROWN]

InitWindow screenWidth, screenHeight, "Tamerlane Chess"

let
    pieceTexTab = toTable {B_KIN : LoadTexture "assets/piece/kd96.png", B_VIZ : LoadTexture "assets/piece/qd96.png", B_BIS : LoadTexture "assets/piece/bd96.png", B_KNI : LoadTexture "assets/piece/nd96.png", B_PWN : LoadTexture "assets/piece/Chess_pdt60.png", B_ROK : LoadTexture "assets/piece/rd96.png", B_PWN : LoadTexture "assets/piece/pd96.png", W_PWN : LoadTexture "assets/piece/pl96.png", W_KNI : LoadTexture "assets/piece/nl96.png", W_BIS : LoadTexture "assets/piece/bl96.png", W_VIZ : LoadTexture "assets/piece/ql96.png", W_KIN : LoadTexture "assets/piece/kl96.png", W_ROK : LoadTexture "assets/piece/rl96.png", W_PWN : LoadTexture "assets/piece/pl96.png"}

while not WindowShouldClose():
    ClearBackground BGREY

    BeginDrawing()
    for i in 0..<board.len:
        for j in 0..<board[i].len:
            DrawRectangle(j * tilesize, i * tilesize, tilesize, tilesize, boardCol[(j + i) mod 2])
            if board[i][j] in pieceTexTab:
                let tex = pieceTexTab[board[i][j]]
                DrawTexturePro(tex, makerect(0, 0, tex.width, tex.height), makerect(j * tilesize, i * tilesize, tilesize, tilesize), makevec2(0, 0), 0, WHITE)
    EndDrawing()