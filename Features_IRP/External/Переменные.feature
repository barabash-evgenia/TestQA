﻿#language: ru

@tree
@IgnoreOnCIMainBuild

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Переменные:
ЗаголовокФормыСпискаПоступления = '{!Metadata.Documents.PurchaseInvoice.ListPresentation}'
ЗаголовокПодсистемаЗакупок = '{!Metadata.Subsystems.PurchaseAP.Synonym}'

*ПроверяемыеЗначения
| 'Имя'                    | 'Представление'            | 'Значение' |
| 'СуммаДокументаВозврата' | 'Сумма документа возврата' | '190,00'   |

ИтоговаяСуммаОтчетаПродажи = 'R16C3'
СообщениеШтрихКодНеНайден = '{!R().S_019}'
