# Migrations

## Step 1:  Create `struct` or `class`  with name and conform to protocol `Migration`
 `func prepare(on database: Database) -> EventLoopFuture<Void>`  <br />
 `func revert(on database: Database) -> EventLoopFuture<Void>`

## Step 2:  Add migration to `configuration.swift` file
`app.migrations.add("your struct")`

## Step 3: Open terminal and run command
```vapor run migrate```
