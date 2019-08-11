int cols[] = {2, 4, 3, 4, 3, 4};
int len;

int light[] = {color(0, 255, 50), color(0, 255, 255), color(255, 0, 255)};
int dark[] = {color(0, 124, 50), color(0, 120, 120), color(120, 0, 120)};
int index = 2;

float w;
float side_margin = 50;
float grid_margin = 5;

String get_time () {  
  int second = second(); 
  String s = (second > 9) ? Integer.toString(second) : "0" + Integer.toString(second);
  
  int minute = minute();
  String m = (minute > 9) ? Integer.toString(minute) : "0" + Integer.toString(minute);
  
  int hour = hour();
  String h = (hour > 9) ? Integer.toString(hour) : "0" + Integer.toString(hour);
  
  String time = h + m + s;
  
  return time;
}

void setup () {
  size(600, 600);
  
  len = cols.length;
  w = (width - 2 * side_margin) / len;
}

void draw () {
  background(51, 200);
  
  String time = get_time();
  
  noStroke();
  
  for (int i = 0; i < len; i++) {    
    char c = time.charAt(i);
    
    float x = side_margin + w * (i + 0.5);
    
    String s = Integer.toString(c, 2);
    s = new StringBuilder(s).reverse().toString();
    
    for (int j = 0; j < cols[i]; j++) {
      
      float y = height - (side_margin + w * (j + 0.5));
      
      float d = w - 2 * grid_margin;
      
      if (s.charAt(j) == '1') {
        fill(light[index]);
      } else {
        fill(dark[index]);
      }
      
      circle(x, y, d);
    }
  }
  
  if (frameCount < 200) {
    saveFrame("img/###-" + Integer.toString(index) + ".png");  
  } else { 
    exit();
  }
}
