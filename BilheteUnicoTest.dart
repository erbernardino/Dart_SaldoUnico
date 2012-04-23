#source("BilheteUnico.dart");
#source("Utils.dart");

class BilheteUnicoTest {

  BilheteUnicoTest() {
  }
  
  static BilheteUnico bu;

  static void run() {
    [testIncialVariaveis,
    testIncrementaSaldo,
    testDecrementaSaldo, 
    testCalculaProximaRecarga,
    testCalculaProximaRecargaComFDS,
    testTemSaldoDiaUtil,
    testTemSaldoDiaFds,
    testNaoTemSaldoDiaUtil,
    testNaoTemSaldoDiaFds].forEach(beforeEach);
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
    bu.saldo = 15.0;
    Date now = new Date(2012, 4, 1, 0, 0, 0, 0);
    Date proximaRecarga = bu.proximaRecarga(now);
    Expect.equals(2012, proximaRecarga.year);
    Expect.equals(4, proximaRecarga.month);
    Expect.equals(4, proximaRecarga.day);
  }
  
  static void testTemSaldoDiaUtil(){
    bu.saldo = 7.0;
    bu.valorDiaUtil = 6.0;
    bu.valorDiaFds = 0.0;
    Expect.isTrue(bu.temSaldo());
  }
  
  static void testTemSaldoDiaFds(){
    bu.saldo = 7.0;
    bu.valorDiaUtil = 0.0;
    bu.valorDiaFds = 6.0;
    Expect.isTrue(bu.temSaldo());
  }
  
  static void testNaoTemSaldoDiaUtil(){
    bu.saldo = 3.0;
    bu.valorDiaUtil = 6.0;
    bu.valorDiaFds = 0.0;
    Expect.isFalse(bu.temSaldo());
  }
  
  static void testNaoTemSaldoDiaFds(){
    bu.saldo = 3.0;
    bu.valorDiaUtil = 0.0;
    bu.valorDiaFds = 6.0;
    Expect.isFalse(bu.temSaldo());
  }
  
  static void testCalculaProximaRecargaComFDS(){
    bu.saldo = 30.0;
    bu.valorDiaUtil = 6.0;
    bu.valorDiaFds = 3.0;
    Date now = new Date(2012, 4, 1, 0, 0, 0, 0);
    Date proximaRecarga = bu.proximaRecarga(now);
    Expect.equals(2012, proximaRecarga.year);
    Expect.equals(4, proximaRecarga.month);
    Expect.equals(6, proximaRecarga.day);
  }
}

void main() {
  BilheteUnicoTest.run();    
}
