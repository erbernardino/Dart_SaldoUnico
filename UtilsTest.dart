#source("Utils.dart");

class UtilsTest {
  static void run() {
    [testFormataDDMMYYYYComZero,
     testFormataDDMMYYYYSemZero].forEach(beforeEach);
  }
  
  static void beforeEach(var test){
    test();
  }
  
  static void testFormataDDMMYYYYComZero() {
    Date now = new Date(2012, 4, 1, 0, 0, 0, 0);
    Expect.equals("01/04/2012", Utils.formatDate(now));
  }
  
  static void testFormataDDMMYYYYSemZero() {
    Date now = new Date(2012, 10, 12, 0, 0, 0, 0);
    Expect.equals("12/10/2012", Utils.formatDate(now));
  }
}

void main() {
  UtilsTest.run();    
}
