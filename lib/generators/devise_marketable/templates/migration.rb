class DeviseAddMarketable<%= table_name.camelize.singularize %> < ActiveRecord::Migration
  def self.up
    add_column :<%= table_name %>, :referring_url, :text
    add_column :<%= table_name %>, :landing_url, :text
  end
  
  def self.down
    remove_column :<%= table_name %>, :referring_url
    remove_column :<%= table_name %>, :landing_url
  end
end