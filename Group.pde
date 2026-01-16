public class Group
{
  private int diameter_L = 20;
  private int diameter_S = 15;
  private int gap = 10;
  private color colorL = #ffffff;
  private color colorS = #121212;

  void dotLarge (int x, int y)
  {
    noStroke();
    fill(colorL);
    ellipse(x, y, diameter_L, diameter_L);
  }

  void dotSmall (int x, int y)
  {
    noStroke();
    fill(colorS);
    ellipse(x, y, diameter_S, diameter_S);
  }

  public void display (int code, int step, int offsetH, int offsetV)
  {
    int groupQty = 4;
    int codeWidth = (3*diameter_L + gap)*groupQty - gap;
    int centerH = offsetH + codeWidth/2 - step * (codeWidth/groupQty) + (codeWidth/groupQty)/2;
    int centerV = offsetV;
    
    if (code == 0)
      {
        dotLarge(centerH - diameter_L, centerV);
        dotSmall(centerH, centerV - diameter_L);
        dotSmall(centerH + diameter_L, centerV);
      }
      else if (code == 1)
      {
        dotLarge(centerH - diameter_L, centerV);
        dotLarge(centerH, centerV - diameter_L);
        dotSmall(centerH + diameter_L, centerV);
      }
      else if (code == 2)
      {
        dotLarge(centerH - diameter_L, centerV);
        dotLarge(centerH, centerV - diameter_L);
        dotLarge(centerH + diameter_L, centerV);
      }
  }
}
