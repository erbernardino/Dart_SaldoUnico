class BilheteUnico {
  double saldo = 0.0;
  double valorDiaUtil = 0.0;
  double valorFinalDeSemana = 0.0;
  
  BilheteUnico(double saldo, double valorDiaUtil, double valorFinalDeSemana){
    this.saldo = saldo;
    this.valorDiaUtil= valorDiaUtil;
    this.valorFinalDeSemana = valorFinalDeSemana;
  }
  
  
  
  toString(){
    return "Saldo: $saldo, valor dia util: $valorDiaUtil, valor final de semana: valorFinalDeSemana";
  }
}
