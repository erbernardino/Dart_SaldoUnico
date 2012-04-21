class BilheteUnico {
  double saldo = 0.0;
  double valorDiaUtil = 0.0;
    
  BilheteUnico(double saldo, double valorDiaUtil){
    this.saldo = saldo;
    this.valorDiaUtil= valorDiaUtil;
  }
  
  
  void adicionaSaldo(double newSaldo){
    this.saldo += newSaldo;
  }
  
  
  Date proximaRecarga([Date now]){
    if(now == null){
      now = new Date.now().add(new Duration(1));
    }
    double diasXsaldo = saldo / valorDiaUtil;
    Date next = now;
    for(int i = 1; i <= diasXsaldo; i++){
      Date currDate = now.add(new Duration(i));
      if(currDate.weekday != Date.SAT && currDate.weekday != Date.SUN){
        next = next.add(new Duration(1));
      }
    }
    return next;
  }
   
  toString(){
    return "Saldo: $saldo, valor dia util: $valorDiaUtil";
  }
}
