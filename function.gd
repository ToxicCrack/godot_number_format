func number_format(val, _decimals = 2, _dec_point = ".", _thousands_sep = ","):
  var number = float(val)

  if(!_dec_point || !_thousands_sep):
    _dec_point = '.';
    _thousands_sep = ',';
  
  var roundedNumber = str(round( abs( number ) * float('1e' + str(_decimals)) ))
  var numbersString = roundedNumber
  var decimalsString = ""
  if(_decimals > 0):
    numbersString = roundedNumber.left(roundedNumber.length()-_decimals)
    decimalsString = roundedNumber.right(roundedNumber.length()-_decimals)
    
  var formattedNumber = ""
  
  while(numbersString.length() > 3):
    formattedNumber += _thousands_sep + numbersString.right(numbersString.length()-3)
    numbersString = numbersString.substr(0, numbersString.length()-3);
  
  var ret = ""
  if(number < 0):
    ret += "-"
  ret += numbersString + formattedNumber
  if(decimalsString != ""):
    ret += (_dec_point + decimalsString)
    
  return ret
