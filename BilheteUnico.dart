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
  
  
  Date proximaRecarga(){
    double diasXsaldo = saldo / valorDiaUtil;
    Date now = new Date.now();
    return now.add(new Duration(diasXsaldo.toInt()));
  }
  
  toString(){
    return "Saldo: $saldo, valor dia util: $valorDiaUtil";
  }
}
