if ('<%= @cart_item.quantity %>'){
$('#cart-item-<%= cart_item.id %> .quantity')
  .html('<%= @cart_item.quantity %>');
}else {
  $('#cart-item-<%= @cart_item.id %>').remove();
}