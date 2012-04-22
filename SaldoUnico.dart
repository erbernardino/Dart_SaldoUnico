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
    
    document.query('#resultado').value = bu.formatDate(proximaRecarga);
    document.query('#resultado').insertAdjacentHTML("afterEnd", getUrlToCallendar(proximaRecarga,"Recarregar Bilhete Único", "Se esquecer de carragar vai parar na catraca!!!") ) ;
    
    document.query("#saldoPorDia").innerHTML = bu.valorPorDia.toString();
  }
  
  
  String getUrlToCallendar(Date date, String title, String description){
    /* Exemplo de URL
    
      <a href="http://www.google.com/calendar/event?action=TEMPLATE&text=Brunch at Java Cafe&dates=20060415T180000Z/20060415T190000Z&location=Java Cafe, San Francisco, CA&details=Try our Saturday brunch special:<br><br>French toast with fresh fruit<br><br>Yum!&trp=true&sprop= website:http://www.javacafebrunches.com&sprop;=name:Jave Cafe"><img src="http://www.google.com/calendar/images/ext/gc_button2.gif"></a>
    */
    
    var ano = date.year;
    var mes = date.month;
    var dia = date.day;
    
    if(mes < 10){
      mes = "0$mes";
    }
    
    if(dia < 10){
      dia = "0$dia";
    }
    
    //20060415T180000Z/20060415T190000Z    
    String dateStr = "$ano$mes$dia/$ano$mes$dia";
    
    return '<a target="_blank" href="http://www.google.com/calendar/event?action=TEMPLATE&text=$title&dates=$dateStr&details=$description&trp=true&sprop=name:SaldoUnico"><img src="http://www.google.com/calendar/images/ext/gc_button2.gif" ></a>';
  }
  
}



void main() {
  new SaldoUnico().run();
}
