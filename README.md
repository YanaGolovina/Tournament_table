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

# Tournament Table

A Ruby gem for creating tournament pairings with a focus on separating players from the same city. This gem helps organize tournaments by ensuring that participants from the same city are placed as far apart as possible in the bracket, maximizing the chances they will only meet in later rounds.

## Features

- Read participant data from CSV or Excel (.xlsx) files
- Create balanced tournament pairings that maximize city separation
- Handle odd number of participants with automatic "BYE" assignments
- Beautiful bracket-style visualization
- Ensures players from the same city meet as late as possible in the tournament

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tournament_table'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install tournament_table
```

## Usage

### Command Line

The gem provides a command-line interface:

```bash
$ tournament_table path/to/your/file.csv
# or
$ tournament_table path/to/your/file.xlsx
```

### In Your Code

```ruby
require 'tournament_table'

# Create tournament pairings from a CSV file
pairs = TournamentTable.create_tournament('path/to/file.csv')

# Create tournament pairings from an Excel file
pairs = TournamentTable.create_tournament('path/to/file.xlsx')
```

### Input File Format

#### CSV Format
Your CSV file should have two columns:
1. Player Name
2. City

Example:
```csv
Player Name,City
Ivan Petrov,Moscow
Anna Ivanova,Saint Petersburg
Sergei Smirnov,Moscow
Maria,Kiev
```

#### Excel Format
Your Excel file should have the same two columns:
1. Player Name
2. City

The first row is considered a header and will be skipped.

### Output Format

The tournament pairings are displayed in a beautiful bracket format:

```
=== Tournament Bracket ===

Round 1:
┌────────────────────────────────────────┐
│          Ivan Petrov (Moscow)          │
│                   vs                   │
│    Anna Ivanova (Saint Petersburg)     │
└────────────────────────────────────────┘
```

### City Separation Algorithm

The gem uses a sophisticated algorithm to ensure players from the same city are separated:

1. Players are first grouped by city
2. Cities with more participants are handled first to ensure optimal spacing
3. Players from the same city are distributed evenly throughout the bracket
4. The pairing system ensures maximum possible distance between players from the same city
5. When there's an odd number of players, a "BYE" is assigned optimally

For example, if there are 4 players from Moscow in a 16-player tournament, they will be distributed so that:
- They can only meet in later rounds
- Each Moscow player is placed in a different quarter of the bracket
- Similar distribution is applied to other cities based on their number of participants

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Timoor/Tournament_table.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

