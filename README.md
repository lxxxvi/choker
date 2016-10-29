[![Build Status](https://travis-ci.org/lxxxvi/choker.svg?branch=master)](https://travis-ci.org/lxxxvi/choker)
[![Code Climate](https://codeclimate.com/github/lxxxvi/choker/badges/gpa.svg)](https://codeclimate.com/github/lxxxvi/choker)

# Choker

Choker is a gem supposed to ease imports of text files into database tables.

## WORK IN PROGRESS

Target synopsis

```ruby
Choker.choke('/path/to/file.csv')
```

Will result in a table named

```sql
choked_file_csv
```

