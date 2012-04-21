#import('dart:html');
#source('BilheteUnico.dart');

class SaldoUnico {

  SaldoUnico() {
  }

  void run() {
    document.query('#calcular').on.click.add(calcularHandler);
  }
  
  void calcularHandler(Event event){
    double saldo = Math.parseDouble(document.query('#saldo').value);
    double valorDiaUtil = Math.parseDouble(document.query('#valorDiaUtil').value);
    BilheteUnico bu = new BilheteUnico(saldo, valorDiaUtil);
    document.query('#resultado').value = bu.proximaRecarga().toString();
  }
  
}

void main() {
  new SaldoUnico().run();
}
