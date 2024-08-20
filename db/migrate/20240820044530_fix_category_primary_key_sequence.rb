class FixCategoryPrimaryKeySequence < ActiveRecord::Migration[6.1]
  def up
    execute("SELECT setval(pg_get_serial_sequence('categories', 'id'), COALESCE(MAX(id), 1) + 1, false) FROM categories")
  end

  def down
    # No rollback needed as this is just a sequence fix
  end
end