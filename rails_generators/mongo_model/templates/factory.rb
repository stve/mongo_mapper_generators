Factory.define :<%= file_name %> do |<%= file_name %>|
<% for attribute in attributes -%>
<% if attribute.name != 'many' && attribute.name != 'index' -%>
  <%= factory_line(attribute, file_name) %>
<% end -%>
<% end -%>
end
