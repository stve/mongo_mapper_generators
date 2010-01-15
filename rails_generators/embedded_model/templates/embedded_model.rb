class <%= class_name %>
  include MongoMapper::EmbeddedDocument

<% attributes.each do |attribute| -%>
  key :<%= attribute.name %>, <%= attribute.type %>
<% end -%>
end
