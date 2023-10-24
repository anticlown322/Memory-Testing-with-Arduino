# О чем репозиторий
Данный репозиторий документирует выполнение [задания](#о-задании) от преподавателя по АКТиОС[^1]. Предыстория получения задания интересная[^2], но не играет роли.

В репозитории находятся [программа](gui%20project/), [прошивка](firmware%20project/) и [журнал выполнения](#журнал), а также документация и другие материалы. Журнал будет периодически обновляться, пока не будет закончен проект. 
## :bookmark_tabs: Кратко о работе
- :label: Плата: **Arduino Nano** ([документация](/assets/docs/Документация/), [официальный сайт](https://arduino.ru/Hardware/ArduinoBoardNano))
- :label: Микроконтроллер: **ATmega328**(необходим oldbootloader)
- :label: Прошивка микроконтроллера: **C**
- :label: GUI: **Python**
- :label: Разработчики: **[Карась А.С.](https://github.com/anticlown322)**, **[Рычихин С.А.](https://github.com/BeerManNotAvailable1)**
## :scroll: О задании
### :pushpin: Проблема
Дан элемент памяти, который необходимо протестировать. Элемент памяти кладут в термошкаф, постепенно повышают температуру(до ок. 50°C). Далее начинается тестирование. Тестирование происходит прогонкой через элемент памяти тестов, исходящих из подсоединенной платы.
### :dart: Задача 
При появлении сообщений об ошибках необходимо выводить их с платы на экран. Для этого должен использоваться GUI, не консоль(слишком просто). Создать приложение с GUI необходимо на Python. 

Прошивку микроконтроллера на плате необходимо делать в CodeVisionAVR на C.
## :hammer_and_wrench: Журнал
### :date: 17.10.2023 - 22.10.2023
Выдача задания
### :date: 23.10.2023 - 26.10.2023
Получение платы
# Заключение
Что-то о рабском труде

*С уважением, команда проекта*

[^1]: Архитектура компьютерной техники и операционных систем. Дисциплина в [БГУИР](https://www.bsuir.by/)(поток ПОИТ 2022-го года поступления). Преподаватель - [Леванцевич Владимир Александрович](https://www.bsuir.by/ru/kaf-poit/levantsevicha-v-a-publikatsii).
[^2]: Т.к. я(Карась А.С.) пропускал большую часть лекций пропускал, то на этом и попался. Пропуски мои были записаны, сулило незавидное будущее. Решил напоследок удивить преподавателя, сделав в [Proteus](https://www.labcenter.com/)'e схему с микроконтроллером собственной прошивки(мелкие забавы с выводом на графический экран). Это заинтересовало преподавателя, поэтому он и дал уже текущее задание, связанное с тестированием.