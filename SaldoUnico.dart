#import('dart:html');
#source('BilheteUnico.dart');
#source('Utils.dart');

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
    
    document.query('#resultado').value = Utils.formatDate(proximaRecarga);
    document.query('#callendarButton').innerHTML = getUrlToCallendar(proximaRecarga,"Recarregar Bilhete Único", "Se esquecer de carragar vai parar na catraca!!!")  ;
    
    //document.query("#saldoPorDia").innerHTML = bu.valorPorDia.toString();
    window.postMessage(Utils.geraDados(bu.valorPorDia), '*');
  }
  
  
  String getUrlToCallendar(Date date, String title, String description){
    String dateStr = Utils.formateDateFromTo(date);
    
    return '<a target="_blank" href="http://www.google.com/calendar/event?action=TEMPLATE&text=$title&dates=$dateStr&details=$description&trp=true&sprop=name:SaldoUnico"><img src="http://www.google.com/calendar/images/ext/gc_button2.gif" ></a>';
  }
  
}



void main() {
  new SaldoUnico().run();
}
