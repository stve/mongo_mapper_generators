class <%= class_name %>
  include MongoMapper::Document

<% if attributes.any? -%>
<% for attribute in attributes -%>
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

<% if indexes.any? -%>
<% indexes.each do |each| -%>
  ensure_index :<%= each.type %>
<% end -%>
<% end -%>

<% if timestamps -%>
  timestamps!
<% end -%>
end
