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
    double valorDiaFDS = Math.parseDouble(document.query('#valorDiaFDS').value);
    BilheteUnico bu = new BilheteUnico(saldo, valorDiaUtil, valorDiaFDS);
    Date proximaRecarga = bu.proximaRecarga();
    int dia = proximaRecarga.day;
    int mes = proximaRecarga.month;
    int ano = proximaRecarga.year;
    // document.query('#resultado').value =  dia + "/" + mes + "/" + ano;
    // document.query('#resultado').value =  " " + dia + "/" + mes + "/" + ano;
    document.query('#resultado').value = "$dia/$mes/$ano";
  }
  
}

void main() {
  new SaldoUnico().run();
}
