#source("BilheteUnico.dart");

class BilheteUnicoTest {

  BilheteUnicoTest() {
  }
  
  static BilheteUnico bu;

  static void run() {
    [testIncialVariaveis,
    testIncrementaSaldo,
    testDecrementaSaldo, 
    testCalculaProximaRecarga].forEach(beforeEach);
  }
  
  static void beforeEach(var test){
    bu = new BilheteUnico(32.98, 6.0);
    test();
  }
  
  static void testIncialVariaveis() {
    Expect.equals(32.98, bu.saldo);
    Expect.equals(6.0, bu.valorDiaUtil);
  }
  
  static void testIncrementaSaldo(){
    bu.adicionaSaldo(10.0);
    double expectedSaldo = 32.98 + 10;
    Expect.equals(expectedSaldo, bu.saldo);
  }
  
  static void testDecrementaSaldo(){
    bu.adicionaSaldo(-10.0);
    double expectedSaldo = 32.98 - 10;
    Expect.equals(expectedSaldo, bu.saldo);
  }
  
  static void testCalculaProximaRecarga(){
    bu.saldo = 30.0;
    Date expectedProximaRecarga = new Date(2012, 04, 28, 0, 0, 0, 0);
    Expect.equals(expectedProximaRecarga, bu.proximaRecarga());
  }
  
}

void main() {
  BilheteUnicoTest.run();  
}
