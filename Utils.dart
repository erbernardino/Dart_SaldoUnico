class Utils {
  static String formatDate(Date date){
    String dia = date.day.toString();
    String mes = date.month.toString();
    String ano = date.year.toString();
    if(dia.length == 1){
      dia = "0$dia";  
    }
    if(mes.length == 1){
      mes = "0$mes";  
    }
    return "$dia/$mes/$ano";
  }
}
