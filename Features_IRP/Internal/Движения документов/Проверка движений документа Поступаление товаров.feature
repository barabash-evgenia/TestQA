﻿#language: ru

@tree
@ДвиженияДокументов


Функционал: проверка движений документа Поступаление товаров

Как Тестировщик я хочу
проверить движения документа Поступаление товаров
чтобы убедиться что документ делает движения по нужным регистрам

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0501 подготовительный сценарий (движения документа Поступление товаров)
	И экспорт основных данных
	И загрузка документа поступления товаров и услуг
	И я выполняю код встроенного языка на сервере
		|'Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: _0502 проверка движений документа по регистру R1001 Закупки
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	И в таблице "List" я перехожу к строке:
		| 'Номер' |
		| '1 001' |
	И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
	И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
	И я нажимаю на кнопку с именем 'GenerateReport'
		
