class <%= class_name %>
  include MongoMapper::Document

<% for attribute in attributes -%>
<% if attribute.name != 'many' && attribute.name != 'index' -%>
  key :<%= attribute.name %>, <%= attribute.type %>
<% end -%>
<% end -%>

<% attributes.select { |each| each.name == 'many' }.each do |each| -%>
  many :<%= each.type.tableize %>
<% end -%>

<% attributes.select { |each| each.name == 'index' }.each do |each| -%>
  ensure_index :<%= each.type.downcase %>
<% end -%>

end
