// Тест сделан так, чтобы его можно было скопипастить и выполнить

#Область Первая

Перем А;

#КонецОбласти

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	Перем А;
	А = 1;

	~Метка: // Тут покрыл, а не должен был

	Если А = 1 Тогда // Тут не покрыл, а должен был

		Б = "Многострочная
			| Строка
			| c " + "конкатенацией";
		А = 2;
	ИначеЕсли А = Методом() Тогда
		А = 3;
		// Комментарий
	Иначе
		Б = "Многострочная
		| Строка
		| c " + Методом();
		А = 4;
	КонецЕсли;

	Если А < 4 Тогда
		Перейти ~Метка;
	КонецЕсли;

	Попытка
		Сообщить(А);
		ВызватьИсключение А;
	Исключение
		А = Б;
	КонецПопытки;


	СЦиклами();
КонецПроцедуры

Функция Методом()

	А = Новый Массив;
	А.Добавить(20);
	А.Добавить(20);

	Если А = 1 Тогда

	КонецЕсли;

	Возврат А.Количество();

КонецФункции

Процедура СЦиклами()

	Перем Б;

	А = Новый Массив;
	А.Добавить(20);

	Для Счетчик = 0 ПО 10 Цикл
		РегистрыСведений.ЦеныКлиентов.Выбрать();
	КонецЦикла;

	Для Каждого Элемент Из А Цикл
		А.Добавить("1");
		Прервать;
	КонецЦикла;

	А = 1;
	Б = 1;
	Пока А = Б Цикл
		Б = 2;
	КонецЦикла;

КонецПроцедуры

#Область Неиспользуемая
&НаКлиенте
Функция Пустая(Знач Парам = 0)
КонецФункции

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Пустая();
КонецПроцедуры
#КонецОбласти

// Последний Вызов, xто бы точно знать, что парсер не отвалился
ПриСозданииНаСервере(Ложь, Ложь);