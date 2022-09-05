#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct array {
  uint64_t len;
  uint64_t set_size;
  uint64_t *data;
} array_t;

uint64_t *array_get(array_t *array, uint64_t index) {
  return &(array->data[index]);
}

void array_append(array_t *array, uint64_t data) {
  array->len++;
  if ((array->len * sizeof(uint64_t)) >= array->set_size) {
    array->data = realloc(array->data, array->set_size + sizeof(uint64_t) * 64);
    array->set_size += sizeof(uint64_t) * 64;
  }
  memcpy(array_get(array, array->len - 1), &data, sizeof(uint64_t));
}

array_t create() {
  array_t va;
  va.len = 0;
  va.data = malloc(sizeof(uint64_t) * 64);
  va.set_size = sizeof(uint64_t) * 64;

  return va;
}

uint64_t try_get(array_t array);

int main() {
  array_t va = create();
  array_append(&va, 88);
  printf("%lu", *array_get(&va, 0));
  printf("%lu", try_get(va));

  return 0;
}
