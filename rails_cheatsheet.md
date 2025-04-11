## Rails cheatsheet

Start the Rails server:

```bash
dip rails s
```

View the list of routes in your app:

```bash
dip rails routes
```

### Models
Generate a new model and create a migration for the table.

Note: Name models in Pascal case and singular.

```bash
dip rails g model Dog
```

Generate a model and create a migration with table columns.

```bash
dip rails g model Dog name:string age:integer
```

The migration automatically created for the above example:

```ruby
class CreateDogs < ActiveRecord::Migration[8.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
```

Destroy the created model if you made a mistake (rollback first if you ran the migration):

Note: you can use `rails d` (destroy) on any scaffolded code to clean up/remove all generated files.

```bash
dip rails d model Dog name:string age:integer
```

#### Migration

Generate a migration to amend an existing table.

```bash
dip rails g migration AddUserToDogs user:references breed:string
```

The migration automatically created for the above example:

```ruby
class AddUserToDogs < ActiveRecord::Migration[8.0]
  def change
    add_reference :dogs, :user, null: false, foreign_key: true
    add_column :dogs, :breed, :string
  end
end
```

Migrate the database:

```bash
dip rails db:migrate
```

Rollback the database:

```bash
dip rails db:rollback
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
