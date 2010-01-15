class <%= class_name %>
  include MongoMapper::Document

<% if attributes.any? -%>
<% attributes.each do |attribute| -%>
  key :<%= attribute.name %>, <%= attribute.type %>
<% end -%>
<% end -%>

<% if many.any? -%>
<% many.each do |each| -%>
  many :<%= each.type %>
<% end -%>
<% end -%>

<% if belongs.any? -%>
<% belongs.each do |each| -%>
  belongs_to :<%= each.type %>
<% end -%>
<% end -%>

<% if timestamps -%>
  timestamps!
<% end -%>

<% if userstamps -%>
  userstamps!
<% end -%>
end
