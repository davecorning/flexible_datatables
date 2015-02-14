# Flexible Datatables

Easily integrate [JQuery Datatables](https://www.datatables.net) (with Ajax) into your Ruby / Rails web applications.

## Introduction
Flexible Datatables wraps array-like objects (ActiveRecord::Relation collections, etc) that JQuery Datatables can read (via ajax) from your Ruby / Rails web application.

## Features
* Any arbitrary array-like collection of data, from plain old ruby arrays to complicated ActiveRecord (or Arel, or plain SQL) query results, can be passed on to JQuery Datatables with very little configuration overhead.
* Server-side pagination with [Kaminari](https://github.com/amatsuda/kaminari) can be used, out of the box.

## Background
This library was inspired by Ryan Bates' excellent [Railscast episode](http://railscasts.com/episodes/340-datatables) and the [ajax-datatables-rails](https://github.com/antillas21/ajax-datatables-rails) gem.

So why not just use [ajax-datatables-rails](https://github.com/antillas21/ajax-datatables-rails)?

1. I wanted to be free to use (abuse) SQL to generate the result set to be passed to DataTables.  The [ajax-datatables-rails](https://github.com/antillas21/ajax-datatables-rails) library constructs ActiveRecord queries on the application's behalf, based on user-supplied column names.
2. I also wanted to the ability to sort on any kind of column, from integer column types to non-string / non-text based columns, to aggregate functions, and so on.
3. Although I usually choose PostgreSQL as my Rails DB backend of choice, I wanted to be able to pass in any kind of array-like collection (or even use a different database backend altogether).

## Installation
1. First, make sure you have [DataTables](https://www.datatables.net) installed.

    You have a few choices here.  If you are integrating DataTables with a Rails project, the easiest route is via the [jquery-datatables-rails](https://github.com/rweng/jquery-datatables-rails) gem.  Be sure to follow the installation instructions if you choose this route.

    You can also use [bower](https://github.com/rharriso/bower-rails), or you can even leverage DataTables' [cdn](https://cdn.datatables.net/).

2. Add this line to your application's `Gemfile`:

        gem 'flexible_datatables'

    And then execute:

        $ bundle

    Or install it yourself as:

        $ gem install flexible_datatables
3. (optional)  Create the file `config/initializers/flexible_datatables.rb`.  You can use this to override default values (such as the choice of pagination).
```ruby
FlexibleDatatables.configuration do |settings|
  # settings.paginator = FlexibleDatatables::KaminariPaginator
  settings.paginator = FlexibleDatatables::SimplePaginator
  # settings.items_per_page = 10
end
```

## Usage
### Rails
*NOTE*

Flexible Datatables isn't required if you wish to use DataTables to transform an html `table` without using ajax (see the first part of the [DataTables RailsCast](http://railscasts.com/episodes/340-datatables?view=asciicast) for reference).

The benefit of using Flexible Datatables comes when one wishes to have DataTables tables displaying data from a Rails backend using ajax.

#### Controller
Flexible Datatables requires the `draw`, `start`, `length`, and `order` keys from the `params` hash.  Initialize a new `FlexibleDatatables::Datatable` object and pass in those values.
```ruby
datatable = FlexibleDatatables::Datatable.new(params.slice(:draw, :start, :length, :order))
```
Pass in a collection of objects (which can come from anywhere; an array, an ActiveRecord query, etc)
```ruby
datatable.collection = MyModel.all
```
Tell your `Datatable` object what your columns are and how to arrange them into rows.
```ruby
datatable.format_grid(%w(first_column, second_column, third_column) do |record|
 [record.first_column, record.second_column, record.third_column]
end
```
Instruct Rails to render your `Datatable` object as `JSON`.  Your controller may look something like this:
```ruby
respond_to do |format|
 format.html
 format.json do
   datatable = FlexibleDatatables::Datatable.new(params.slice(:draw, :start, :length, :order))
   datatable.collection = MyModel.all
   datatable.format_grid(%w(first_column, second_column, third_column) do |record|
     [record.first_column, record.second_column, record.third_column]
   end
   render json: datatable
   end
end
```

#### View
Define a `table` with an `id` attribute.
Give the `table` a `data-source` attribute that points to the route that DataTables will use to get the json data over ajax.
Give this `table` a `thead` with some header columns, and an empty `tbody` declaration.

#### JavaScript
Finally, in a javascript file, call `.DataTable()` and pass in values for the `processing`, `serverSide`, `ajax`, and `pagingType` parameters.
```Coffeescript
$ ->
  $('#my_table_id').DataTable
    processing: true
    serverSide: true
    ajax: $('#my_table_id').data('source')
    pagingType: "full_numbers"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

GPL-3.0+
