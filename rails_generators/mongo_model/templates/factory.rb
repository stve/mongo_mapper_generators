Factory.define :<%= file_name %> do |<%= file_name %>|
<% for attribute in attributes -%>
  <%= factory_line(attribute, file_name) %>
<% end -%>
<% if timestamps %>
  <%= factory_line(MongoAttribute.new('created_at', 'timestamp'), file_name) %>
  <%= factory_line(MongoAttribute.new('updated_at', 'timestamp'), file_name) %>
<% end -%>
end
