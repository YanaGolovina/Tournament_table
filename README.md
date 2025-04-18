# Библиотека для проведения жеребьевки соревнований

## Описание

Данная библиотека предназначена для автоматического распределения участников соревнований по парам и построения сетки соревнований. Она позволяет организовать турниры, учитывая географическое расположение участников, чтобы минимизировать встречи участников из одного города на ранних стадиях турнира.

## Функциональные требования

1. **Автоматическое распределение участников**: Библиотека должна автоматически распределять участников по парам для проведения соревнований.
   
2. **Минимизация встреч участников из одного города**: Участники из одного города должны встретиться как можно позже в турнире. Например, если участвует 16 человек и двое из Ростова-на-Дону, то они могут встретиться только в финале.

3. **Ввод данных**: Библиотека должна принимать заявки в виде файлов формата Excel или CSV, содержащих информацию о участниках.

4. **Визуализация турнирной сетки**: Дополнительно библиотека может визуализировать турнирную сетку, чтобы упростить восприятие результатов и структуры турнира.

### Установка
___

Для установки библиотеки выполните следующие шаги:

1. Клонируйте репозиторий:

   ```bash
   git clone https://github.com/YanaGolovina/Tournament_table.git

2. Перейдите в директорию проекта:

    cd Tournament_table

3. Установите необходимые зависимости:

    pip install -r requirements.txt

### Использование
___
Пример использования библиотеки:

1. Создание экземпляра турнира

    tournament = Tournament.new

2. Загрузка участников из файла

    tournament.load_participants('participants.csv')

3. Проведение жеребьевки

    tournament.draw_lots

4. Визуализация турнирной сетки

    tournament.visualize_bracket

