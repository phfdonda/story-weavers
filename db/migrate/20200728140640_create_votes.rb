class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes, &:timestamps
  end
end
