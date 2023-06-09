﻿#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Заполнение шапки документа Заказ 

Как Менеджер по закупкам я хочу
заполнить шапку документа Заказ 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: заполняю шапку документа Заказ 
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	Когда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка "Валюта взаиморасчетов" я выбираю точное значение 'Рубли'