import 'package:flutter/material.dart';

enum ErrorsEnum {
  cameraInitialError,
  codeMismatchException,
  // Несоответствие кода
  emptyFieldError,
  emptyPhoneNumberError,
  expiredCodeException,
  // Код с истекшим сроком действия
  invalidError,
  invalidfieldsError,
  invalidInnLengthError,
  invalidPinError,
  invalidPhoneNumberError,
  invalidPhoneNumberLengthError,
  noInternetConnectionError,
  timeOutError,
  systemError,
  wrongPincCodeError,
  // Ошибка. Неправильный пин-код
  responceCancel,
  // Ответ.Отмена
  connectionTimeOut,
  // Время соединения вышло
  notEnoughPoints,
  // Недостаточно баллов
  emailAllreadyExist,
  // Электронная почта уже существует
}

String getErrors(
  BuildContext context,
  ErrorsEnum error,
) {
  switch (error) {
    case ErrorsEnum.invalidPhoneNumberError:
      return "InvalidPhoneNumberError";
    // Ошибка. Вы неправильно ввели номер телефона
    case ErrorsEnum.invalidPhoneNumberLengthError:
      return "InvalidPhoneNumberLengthError";
    // Ошибка. Вы неправильно ввели длину номера телефона
    case ErrorsEnum.cameraInitialError:
      return "Неправильный пин код";
    case ErrorsEnum.codeMismatchException:
    case ErrorsEnum.emptyFieldError:
      return "Empty Field error";
    // Ошибка. Заполните поле
    case ErrorsEnum.emptyPhoneNumberError:
      return "EmptyPhoneNumberError";
    // Ошибка. Введите номер телефона
    case ErrorsEnum.expiredCodeException:
      // Исключение кода с истекшим сроком действия
      return "Неправильный пинкод";
    case ErrorsEnum.invalidError:
      return "Invalid Error";
    // Неверная ошибка
    case ErrorsEnum.invalidfieldsError:
      return "invalidfieldsError Error";
    // Ошибка. Неверно заполнили поле
    case ErrorsEnum.invalidInnLengthError:
      return "invalidfieldsError Error";
    // Ошибка. Неверно заполнили длину поля
    case ErrorsEnum.invalidPinError:
      return "invalidPinError ";
    // Ошибка. Неверно ввели пин код
    case ErrorsEnum.noInternetConnectionError:
      return "Нет интернета";
    case ErrorsEnum.timeOutError:
      return "Время запроса истекло попробуйте позже";
    case ErrorsEnum.systemError:
      return "Системная ошибка";
    case ErrorsEnum.wrongPincCodeError:
      return "Неправильный пин код";
    case ErrorsEnum.responceCancel:
      return "Запрос отмене";
    case ErrorsEnum.connectionTimeOut:
      return "Время ожидание от сервера истекло проверьте интернет соединение";
    case ErrorsEnum.notEnoughPoints:
      return "Недостаточно баллов";
    case ErrorsEnum.emailAllreadyExist:
      return "Такое значение поля email уже существует.";
  }
}
