uses graphABC;
type
  point = record
    x, y: integer;
  end;

var
  doodler, fon, platform: picture;
  Left, Right, x, y, i, h: integer;
  vx, vy: real; //Переменные скорости
  platforms: array [1..20] of point;
  game, active, how, settings: boolean;

procedure KeyDown(Key: integer);
begin
  if Key = vk_left then Left := 1;
  if Key = vk_right then Right := 1;
  if key = vk_Escape then game := false;
  if key = vk_Escape then how := false;
  if key = vk_Escape then settings := false;
end;

procedure KeyUp(Key: integer);
begin
  if Key = vk_left then Left := 0;
  if Key = vk_right then Right := 0;
end;

procedure MouseUp(x, y, mb: integer);
begin
  if (mb = 1) and (x > 160) and (x < 340) and (y > 233 ) and (y < 263) then game := true;
  if (mb = 1) and (x > 160) and (x < 340) and (y > 290 ) and (y < 320) then how := true;
  if (mb = 1) and (x > 160) and (x < 340) and (y > 347 ) and (y < 377) then settings := true;
  if (mb = 1) and (x > 160) and (x < 340) and (y > 404 ) and (y < 434) then active := false;
end;


begin
  window.Caption := 'Gucci_v1.0';
  SetWindowSize(500, 700);
  window.SetPos(425, 0);
  window.IsFixedSize := true;
  LockDrawing;
  OnKeyDown := KeyDown;
  OnKeyUp := KeyUp; 
  OnMouseUp := MouseUp;
  doodler := picture.Create('img\doodler.png');
  fon := picture.Create('img\fon.png');
  platform := picture.Create('img\platform.png');
  active := true;
  game := false;
  while active do
  begin
    ClearWindow;
    x := 250;//Координатф появления дудлера
    y := 300;
    h := 350; //Середина экрана
    for i := 1 to 20 do 
    begin
      platforms[i].x := random(500);
      platforms[i].y := random(700);
    end;
    //================= Меню ===================//
    SetPenColor(clBlack);
    SetFontColor(clBlack);
    SetBrushColor(clTransparent);
    Setfontsize(13);
    TextOut(180, 10, 'Doodle Jump_v1.1' );
    Line(40, 30, 460, 30);
    SetFontColor(clYellow);
    SetPenColor(clLimeGreen);
    SetBrushColor(clLimeGreen);
    Setfontsize(15);
    
    Rectangle(160, 233, 340, 263);
    DrawTextCentered(160, 233, 340, 263, 'Играть');
    
    Rectangle(160, 290, 340, 320);
    DrawTextCentered(160, 290, 340, 320, 'Как играть ?');
    
    Rectangle(160, 347, 340, 377);
    DrawTextCentered(160, 347, 340, 377, 'Настройки');
    
    Rectangle(160, 404, 340, 434);
    DrawTextCentered(160, 404, 340, 434, 'Выход');
    
    Setfontsize(20);
    Rectangle(100, 461, 400, 561);
    TextOut(175, 465, 'Ваш рекорд:');
    
    Setfontsize(13);
    SetFontColor(clBlack);
    SetBrushColor(clTransparent);
    TextOut(185, 610, 'Костя Полещук');
    Redraw;
    //================= Меню : Как играть ? ===================//
    while how do
    begin
      ClearWindow;
      SetPenColor(clBlack);
      SetFontColor(clBlack);
      SetBrushColor(clTransparent);
      Setfontsize(13);
      TextOut(180, 10, 'Doodle Jump_v1.1' );
      Line(40, 30, 460, 30);
      SetBrushColor(clTransparent);
      //            TextOut(150, 510, 'Íèêèòà Ïàðàìîíîâ');
      //            TextOut(10, 50, 'Öåëü èãðû - äîáðàòüñÿ êàê ìîæíî âûøå');
      //            TextOut(10, 70, 'Óïðàâëåíèå ñ ïîìîùüþ ñòðåëîê ÂÏÐÀÂÎ è ÂËÅÂÎ');
      //            TextOut(15, 85, 'íà êëàâèàòóðå');
      //            TextOut(10, 105, 'Âûõîä â ãëàâíîå ìåíþ - êëàâèøà Esc');
      //            SetFontColor(clRed);
      //            TextOut(10, 125, 'Âíèìàíèå!');
      //            SetFontColor(clBlue);
      //            TextOut(80, 125, 'Äëÿ ñîõðàíåíèÿ âàøèõ ðåêîðäîâ');
      //            TextOut(15, 140, 'ðåêîìåíäóåòñÿ âûõîäèòü èç ïðîãðàììû ñ ïîìîùüþ');
      //            TextOut(15, 155, '"Âûõîä" â ãëàâíîì ìåíþ');
      Redraw;
    end;
    
        //================= Меню : Настройки ===================//
    while settings do
    begin
      ClearWindow;
      SetPenColor(clBlack);
      SetFontColor(clBlack);
      SetBrushColor(clTransparent);
      Setfontsize(13);
      TextOut(180, 10, 'Doodle Jump_v1.1' );
      Line(40, 30, 460, 30);
      SetBrushColor(clTransparent);
      //            TextOut(150, 510, 'Íèêèòà Ïàðàìîíîâ');
      //            SetFontColor(clBlue);TextOut(10, 50, 'Âàøå èìÿ: ');SetFontColor(clBlack);TextOut(150, 50, DB[2]);
      //            SetFontColor(clBlue);TextOut(10, 70, 'Âàø Äóäëåð: ');SetFontColor(clBlack);TextOut(150, 70, 'Îáû÷íûé');picture.create('data/doodler.png');doodler.draw(250, 50);
      //            SetFontColor(clBlue);TextOut(10, 90, 'Ðàçìåð îêíà: ');SetFontColor(clBlack);TextOut(150, 90, '400x533');
      //            SetFontColor(clBlue);TextOut(10, 110, 'Çâóêè: ');SetFontColor(clBlack);TextOut(150, 110, 'âûêë');
      //            SetFontColor(clBlue);TextOut(10, 130, 'Âû íàõîäèòåñü â èãðå: ');SetFontColor(clBlack);TextOut(150, 130, (Milliseconds / 1000));
      //            SetFontColor(clBlue);TextOut(10, 150, 'Âûâîä fps:');SetFontColor(clBlack);TextOut(150, 150, 'âêë');
      //            SetFontColor(clRed);TextOut(10, 170, 'Ðàçäåë â ðàçðàáîòêå');
      Redraw;
      
    end;
    //================= Меню ===================//
    while game do
    begin
      fon.Draw(0, 0); 
      
      for i := 1 to 20 do
      begin
        platform.Draw(platforms[i].x, platforms[i].y);
        doodler.Draw(x, y);
      end;
      if Left = 1 then x := x - 3;
      if Right = 1 then x := x + 3;
      vy := vy + 0.1; //Падение
      y :=  y + round(vy);
      for i := 1 to 20 do 
      begin
        if (x + 36 > platforms[i].x ) and 
        (x + 5 < platforms[i].x + 56 ) and 
        (y + 56 > platforms[i].y) and 
        (y + 56 < platforms[i].y + 14) and 
        (vy > 0) then
        begin
          vy := -7;
        end;
        if x > 500 then x := 0;
        if x < 0 then x := 500;
      end;
      
      if y < h then
      begin
        for i := 1 to 20 do 
        begin
          y := h;
          platforms[i].y := platforms[i].y - round(vy);
          if (platforms[i].y > 700) then
          begin
            platforms[i].y := 0;
            platforms[i].x := random(500);
          end;
        end;
      end;
      
      
      Redraw;
    end;
  end;
  Halt;
end.