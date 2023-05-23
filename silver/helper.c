#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/types.h>

void print_addr(char *addr) { printf("addr: %lx\n", (unsigned long int)addr); }

void printint(uint64_t i) {printf("int: %lu\n", i);}

void cinit() {setbuf(stdout, NULL);}

char* readFile(char* name) {
  char * buffer = 0;
  long length;
  FILE * f = fopen (name, "rb");

  if (f)
  {
    fseek (f, 0, SEEK_END);
    length = ftell (f);
    fseek (f, 0, SEEK_SET);
    buffer = malloc (length);
    if (buffer)
    {
      fread (buffer, 1, length, f);
    }
    fclose (f);
  } else {printf("NO NO BAD NO FILE"); exit(1);}

  return buffer;
}

// char *itoa(int num, char *buffer, int base) {
//   int curr = 0;

//   if (num == 0) {
//     // Base case
//     buffer[curr++] = '0';
//     buffer[curr] = '\0';
//   return buffer;
// }

// int num_digits = 0;

// if (num < 0) {
//   if (base == 10) {
//     num_digits++;
//       buffer[curr] = '-';
//       curr++;
//       // Make it positive and finally add the minus sign
//       num *= -1;
//     } else
//       // Unsupported base. Return NULL
//       return NULL;
//   }

//   num_digits += (int)floor(log(num) / log(base)) + 1;

//   // Go through the digits one by one
//   // from left to right
//   while (curr < num_digits) {
//     // Get the base value. For example, 10^2 = 1000, for the third digit
//     int base_val = (int)pow(base, num_digits - 1 - curr);

//     // Get the numerical value
//     int num_val = num / base_val;

//     char value = num_val + '0';
//     buffer[curr] = value;

//     curr++;
//     num -= base_val * num_val;
//   }
//   buffer[curr] = '\0';
//   return buffer;
// }

// #include <stdint.h>

// typedef struct vararrayu64 {
//   uint64_t len;
//   uint64_t set_size;
//   uint64_t *data;
// } vararrayu64_t;

// uint64_t *test();
// uint64_t try_get(vararrayu64_t);
// vararrayu64_t test2();

// int main() {
//   uint64_t *dat = test();

//   printf(": %lu\n", *dat);

//   vararrayu64_t va = test2();

//   printf("%lu", va.len);

//   return 0;

//   va.data = malloc(sizeof(uint64_t) * 64);
//   va.data[0] = 18;
//   printf("%lu", va.data[0]);

//   printf("/n/n%lu", try_get(va));

//   return 0;
// }
