class ResetVerticalsPkSequence < ActiveRecord::Migration[7.1]
  def up
    # Reset the primary key sequence for the verticals table
    ActiveRecord::Base.connection.reset_pk_sequence!('verticals')
  end

  def down
    # No rollback needed for sequence reset
  end
end
