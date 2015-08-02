class AddLogoComment < ActiveRecord::Migration
  def self.up
    add_attachment :comments, :avatar
  end

  def self.down
    remove_attachment :comments, :avatar
  end
end
