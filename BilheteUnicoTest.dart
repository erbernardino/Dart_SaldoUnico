#source("BilheteUnico.dart");

class BilheteUnicoTest {

  BilheteUnicoTest() {
  }

  void run() {
    BilheteUnico bu = new BilheteUnico(32.98, 6.0, 0.0);
    print(bu);
  }
  
}

void main() {
  new BilheteUnicoTest().run();
}
