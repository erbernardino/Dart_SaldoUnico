#source("Utils.dart");

class UtilsTest {
  static void run() {
    [testFormataDDMMYYYYComZero,
     testFormataDDMMYYYYSemZero,
     testGeraDados].forEach(beforeEach);
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
  
  static void testGeraDados(){
    LinkedHashMap map = new LinkedHashMap();
    map["01/01/2012"] = 2.0;
    map["02/01/2012"] = 1.0;
    var result = Utils.geraDados(map);
    // [["01/01/2012",1],["02/01/2012",1]]
    Expect.equals("01/01/2012", result[1][0]);
    Expect.equals(2.0, result[1][1]);
    Expect.equals("02/01/2012", result[2][0]);
    Expect.equals(1.0, result[2][1]);
  }
}

void main() {
  UtilsTest.run();    
}
