## Rails cheatsheet

Start the Rails server:

```bash
dip rails s
```

View the list of routes in your app:

```bash
dip rails routes
```

Migrate the database:

```bash
dip rails db:migrate
```

Rollback the database:

```bash
dip rails db:rollback
```

### Models
Generate a model and create a migration for the table.

Note: Name models in Pascal case and singular.

```bash
dip rails g model Book
```

Generate a model and create a migration with table columns.

```bash
dip rails g model Book title:string description:text
```

The migration automatically created for the above example:

```ruby
class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
```

### Controllers
Generate a new controller

Note: Name controllers in Pascal case and pluralize.

```bash
dip rails g controller Books
```

Generate a new controller with default actions, routes and views

```bash
dip rails g controller Books index show
```
