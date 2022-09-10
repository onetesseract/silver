#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

typedef struct array {
  uint64_t len;
  uint64_t set_size;
  uint64_t *data;
} array_t;

uint64_t *array_get(array_t *array, uint64_t index) {
  uint64_t *data = array->data;
  return &(data[index]);
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

uint64_t *test();

uint64_t *try_get(array_t *array);

array_t test2();

int main() {
  array_t va = create();
  array_append(&va, 88);
  printf("%lu\n", *array_get(&va, 0));
  fflush(NULL);
  // sleep(2);

  uint64_t *var = try_get(&va);

  printf("%p\n", var);
  printf("%lu", *var);

  fflush(NULL);

  printf("%p\n", test());

  fflush(NULL);

  array_t v = test2();

  // printf("%lu", *array_get(&v, 0));
  printf("%lu", v.len);

  return 0;
}

void printint(uint64_t val) { printf("Print-inted: %lu\n", val); }
