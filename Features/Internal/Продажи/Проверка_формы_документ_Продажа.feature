﻿#language: ru

@tree

Функционал: создание документа Продажа

Как тестировщик я хочу
проверить создание документа Продажа
чтобы убедиться, что у пользователя не возникнет проблем  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _финальное_задание_03_01 подготовительный сценарий
	И Загружаю справочники	

Сценарий: проверка зависимости поля Вид цен от поля Покупатель
	Когда я закрываю все окна клиентского приложения
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* Проверка зависимости поля Вид цен от поля Покупатель
	И элемент формы с именем "Покупатель" стал равен ''
	И элемент формы с именем "ВидЦен" стал равен ''
	Когда я нажимаю кнопку выбора у поля с именем "Покупатель"
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000012' | 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда элемент формы с именем "Покупатель" стал равен 'Мосхлеб ОАО'
	И элемент формы с именем "ВидЦен" стал равен 'Оптовая'
	Когда я нажимаю кнопку выбора у поля с именем "Покупатель"
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'              |
		| '000000014' | 'Магазин "Бытовая техника"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда элемент формы с именем "Покупатель" стал равен 'Магазин \"Бытовая техника\"'
	И элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'
	Когда я нажимаю кнопку выбора у поля с именем "Покупатель"
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000010' | 'Корнет ЗАО'   |
	И в таблице "Список" я выбираю текущую строку
	Тогда элемент формы с именем "Покупатель" стал равен 'Корнет ЗАО'
	И элемент формы с именем "ВидЦен" стал равен 'Закупочная'
	Когда я нажимаю кнопку выбора у поля с именем "Покупатель"
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'       |
		| '000000015' | 'Магазин "Обувь"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда элемент формы с именем "Покупатель" стал равен 'Магазин "Обувь"'
	И элемент формы с именем "ВидЦен" стал равен 'Розничная'
			
Сценарий: проверка зависимости поля Валюта взаиморасчетов от поля Организация
	Когда я закрываю все окна клиентского приложения
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* Проверка зависимости поля Валюта взаиморасчетов от поля Организация
	И элемент формы с именем "Валюта" отсутствует на форме
	Когда из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	Тогда элемент формы с именем "Валюта" присутствует на форме
	И элемент формы с именем "Валюта" стал равен ''
	Когда из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	Тогда элемент формы с именем "Валюта" отсутствует на форме
				
Сценарий: проверка заполнения табличной части документа Продажа
	И создание документа Поступление товара
	И создание документа Цена товара
	Когда я закрываю все окна клиентского приложения
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Проверка заполнения табличной части документа	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И в таблице "Список" я перехожу к строке:
		| 'Код'   |
		| '$Код$' |
	И в таблице "Список" я выбираю текущую строку
	Тогда таблица "Товары" стала равной:
		| 'N' | 'Товар'          | 'Цена'   | 'Количество' | 'Сумма'  |
		| '1' | 'Тестовый товар' | '537,00' | '1,00'       | '537,00' |

Сценарий: проверка расчета суммы документа Продажа
	И создание документа Поступление товара
	И создание документа Цена товара
	Когда я закрываю все окна клиентского приложения
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Проверка заполнения табличной части документа	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И в таблице "Список" я перехожу к строке:
		| 'Код'   |
		| '$Код$' |
	И в таблице "Список" я выбираю текущую строку
	Тогда таблица "Товары" стала равной:
		| 'N' | 'Цена'   | 'Количество' | 'Сумма'  |
		| '1' | '537,00' | '1,00'       | '537,00' |
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '1'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '537'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00'
	Тогда таблица "Товары" стала равной:
		| 'N' | 'Цена'   | 'Количество' | 'Сумма'    |
		| '1' | '537,00' | '5,00'       | '2 685,00' |
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '5'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '2 685'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я перехожу к строке:
		| 'N' |
		| '2' |
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И в таблице "Список" я перехожу к строке:
		| 'Код'   |
		| '$Код$' |
	И в таблице "Список" я выбираю текущую строку
	Тогда таблица "Товары" стала равной:
		| 'N' | 'Товар'          | 'Цена'   | 'Количество' | 'Сумма'    |
		| '1' | 'Тестовый товар' | '537,00' | '5,00'       | '2 685,00' |
		| '2' | 'Тестовый товар' | '537,00' | '1,00'       | '537,00'   |
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '6'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '3 222'

Сценарий: проверка создания документа Продажа
	И создание документа Поступление товара
	И создание документа Цена товара
	Когда я закрываю все окна клиентского приложения
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение табличной части документа	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И в таблице "Список" я перехожу к строке:
		| 'Код'   |
		| '$Код$' |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '4,00'	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я перехожу к строке:
		| 'N' |
		| '2' |	
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И в таблице "Список" я перехожу к строке:
		| 'Код'   |
		| '$Код$' |
	И в таблице "Список" я выбираю текущую строку	
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я удаляю переменную '$Номер_документа_Продажа$'
	И я запоминаю значение поля "Номер" как "Номер_документа_Продажа"
* Проведение документа	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
* Проверка создания документа	
	И в таблице "Список" я перехожу к строке:
		| 'Номер'                     |
		| '$Номер_документа_Продажа$' |
	Тогда таблица "Список" содержит строки
		| 'Номер'                     | 'Организация'  | 'Покупатель'  | 'Склад' | 'Валюта взаиморасчетов' | 'Вид цен' |
		| '$Номер_документа_Продажа$' | 'ООО "Товары"' | 'Мосхлеб ОАО' | 'Малый' | 'Рубли'                 | 'Оптовая' |		
		
		
		
		
		
		
		
		
	
		
		


				


				
			
		
		


	