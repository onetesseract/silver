typedef struct linked_list_item {
   struct linked_list_item* follower;
   void* aaa;
} linked_list_item_t;

void somefun(linked_list_item_t);

void some() {
   linked_list_item_t b;
   b.follower = &b;

   somefun(b);
}
