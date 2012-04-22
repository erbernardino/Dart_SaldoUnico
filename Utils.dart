class Utils {
  static String formatDate(Date date){
    String dia = twoDigits(date.day.toString());
    String mes = twoDigits(date.month.toString());
    String ano = date.year.toString();
    
    return "$dia/$mes/$ano";
  }
  
  static String formateDateFromTo(Date date){
    
    String dia = twoDigits(date.day.toString());
    String mes = twoDigits(date.month.toString());
    String ano = date.year.toString();
    
    String dateStr = "$ano$mes$dia";
    
    
    //20060415T180000Z/20060415T190000Z    
     return  "$dateStr"+"T050000Z/$dateStr"+"T060000Z";
    
  }
  
  static Object geraDados(Map dados){
    List result = new List();
    
    List resultIn = new List();
    resultIn.add("Dia");
    resultIn.add("Valor");
    result.add(resultIn);
    
    
    for(String key in dados.getKeys()){
      List resultIn = new List();
      resultIn.add(key);
      resultIn.add(dados[key]);
      result.add(resultIn);
    }
    return result;
  }
  
  
  static String twoDigits(String str){
    if(str.length == 1){
      str = "0$str";  
    }
    return str;
  }
  
}
