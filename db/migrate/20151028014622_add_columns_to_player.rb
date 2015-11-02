class AddColumnsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :birthdate, :string
    add_column :players, :age, :integer
    add_column :players, :height_in, :integer
    add_column :players, :weight_lb, :integer
    add_column :players, :games_played, :integer
    add_column :players, :avg_minutes, :string
    add_column :players, :fg_made, :float
    add_column :players, :fg_attempted, :float
    add_column :players, :threes_made, :float
    add_column :players, :threes_attempted, :float
    add_column :players, :threes_percentage, :float
    add_column :players, :ft_made, :float
    add_column :players, :ft_attempted, :float
    add_column :players, :ft_percentage, :float
    add_column :players, :oreb, :float
    add_column :players, :dreb, :float
    add_column :players, :rebounds, :float
    add_column :players, :assists, :float
    add_column :players, :turnovers, :float
    add_column :players, :steals, :float
    add_column :players, :blocks, :float
    add_column :players, :fouls, :float
    add_column :players, :points, :float
  end
end
