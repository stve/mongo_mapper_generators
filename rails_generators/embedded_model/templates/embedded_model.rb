class <%= class_name %>
  include MongoMapper::EmbeddedDocument

<% for attribute in attributes -%>
  key :<%= attribute.name %>, <%= attribute.type %>
<% end -%>
end
