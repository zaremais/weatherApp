// import 'package:flutter/material.dart';

String getIcon(String icon) {
  switch (icon) {
    case 'Mist':
      return 'http://openweathermap.org/img/wn/50d@4x.png';

    case 'Rain':
      return 'http://openweathermap.org/img/wn/10d@4x.png';

    case 'Snow':
      return 'http://openweathermap.org/img/wn/02d@4x.png';
  }
  return "assets/images/clear.png";
}
