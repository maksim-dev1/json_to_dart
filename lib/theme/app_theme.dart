import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.roboto().fontFamily,

  scaffoldBackgroundColor: Color.fromARGB(255, 2, 2, 2),
);

const Map<String, TextStyle> codeEditorStyle = {
  // Скобки, двоеточия, запятые: { } [ ] : , — обычно отвечает за цвет скобок.
  'punctuation': TextStyle(color: Color.fromARGB(255, 30, 144, 255)),

  // Символьные константы/метки; иногда скобки/символы маркируются как `symbol`.
  'symbol': TextStyle(color: Color(0xFFFF7043)),

  // Комментарии в коде (//, /* */ и т.п.)
  'comment': TextStyle(color: Colors.green, fontStyle: FontStyle.italic),

  // Теги внутри комментариев (например @param, @return)
  'doctag': TextStyle(color: Colors.green),

  // Ключевые слова языка (if, else, return, а также true/false/null)
  'keyword': TextStyle(color: Colors.green),

  // Встроенные объекты / функции / константы стандартной библиотеки
  'built_in': TextStyle(color: Colors.purple),

  // Литералы (true, false, null и т.п.)
  'literal': TextStyle(color: Colors.purple),

  // Числа (целые, дробные, экспоненциальные)
  'number': TextStyle(color: Color.fromARGB(255, 30, 144, 255)),

  // Строковые литералы
  'string': TextStyle(color: Color.fromARGB(255, 30, 144, 255)),

  // Строки внутри meta-блоков
  'meta-string': TextStyle(color: Colors.grey),

  // Escape-последовательности внутри строк: \n, \u1234 и т.п.
  'char.escape': TextStyle(color: Colors.orange),

  // Встраиваемые выражения внутри строк (например ${...})
  'subst': TextStyle(color: Colors.orange),

  // Общее имя (класс/функция/заголовок)
  'title': TextStyle(color: Colors.blueAccent),

  // Имя класса при объявлении
  'title.class': TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),

  // Наследуемый/базовый класс
  'title.class.inherited': TextStyle(color: Colors.blueAccent),

  // Имя функции при объявлении
  'title.function': TextStyle(color: Colors.blueAccent),

  // Имя функции/метода при вызове
  'title.function.invoke': TextStyle(color: Colors.blueAccent),

  // Список параметров функции/метода
  'params': TextStyle(color: Colors.black54),

  // Обычные переменные
  'variable': TextStyle(color: Colors.black),

  // Специальные переменные языка (this, self, super и т.п.)
  'variable.language': TextStyle(color: Colors.black54),

  // Константы (например ALL_CAPS)
  'variable.constant': TextStyle(color: Colors.black),

  // Директивы, аннотации, препроцессорные инструкции
  'meta': TextStyle(color: Colors.brown),

  // REPL / shell prompt в примерах
  'meta.prompt': TextStyle(color: Colors.brown),

  // Ключевые слова внутри meta блока
  'meta.keyword': TextStyle(color: Colors.brown),

  // HTML/XML тэги
  'tag': TextStyle(color: Colors.indigo),

  // Имя тега или первое слово в s-expression
  'name': TextStyle(color: Colors.indigo),

  // Имена атрибутов / ключи (например ключи JSON)
  'attr': TextStyle(color: Color.fromRGBO(108, 108, 108, 1.0), fontWeight: FontWeight.w600),

  // Имя атрибута (в тэге или property name у CSS)
  'attribute': TextStyle(color: Color.fromARGB(255, 30, 144, 255)),

  // Маркеры списков (•, -, +)
  'bullet': TextStyle(color: Colors.grey),

  // Блоки/встроенный код в маркапах
  'code': TextStyle(fontFamily: 'monospace'),

  // Курсив / emphasis
  'emphasis': TextStyle(fontStyle: FontStyle.italic),

  // Жирный / strong
  'strong': TextStyle(fontWeight: FontWeight.bold),

  // Математические формулы
  'formula': TextStyle(color: Colors.orange),

  // Ссылки (URL)
  'link': TextStyle(decoration: TextDecoration.underline),

  // Цитаты / blockquote
  'quote': TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),

  // Селектор по тегу (div, a и т.п.)
  'selector-tag': TextStyle(color: Colors.teal),

  // #id селекторы
  'selector-id': TextStyle(color: Colors.teal),

  // .class селекторы
  'selector-class': TextStyle(color: Colors.teal),

  // [attr] селекторы
  'selector-attr': TextStyle(color: Colors.teal),

  // :hover, :before и т.п.
  'selector-pseudo': TextStyle(color: Colors.teal),

  // Тэги шаблонизатора
  'template-tag': TextStyle(color: Colors.deepPurple),

  // Переменные внутри шаблонов
  'template-variable': TextStyle(color: Colors.deepPurple),

  // Строки, помеченные как добавленные (+)
  'addition': TextStyle(backgroundColor: Color(0x2200FF00)),

  // Строки, помеченные как удалённые (-)
  'deletion': TextStyle(backgroundColor: Color(0x22FF0000)),

  // Регулярные выражения
  'regexp': TextStyle(color: Colors.orangeAccent),

  // Операторы: + - * / == && и т.п.
  'operator': TextStyle(color: Colors.black),

  // Свойства объектов (obj.prop)
  'property': TextStyle(color: Colors.black87),

  // Базовый/корневой стиль (иногда используется библиотекой)
  'root': TextStyle(color: Colors.black),

  // Устаревший вариант для классов
  'class': TextStyle(color: Colors.blueAccent),

  // Устаревший вариант для функций
  'function': TextStyle(color: Colors.blueAccent),

  // Вариант названия после преобразования имени scope
  'title.class_': TextStyle(color: Colors.blueAccent),

  // Ещё один вариант для имён классов
  'class-title': TextStyle(color: Colors.blueAccent),
};
