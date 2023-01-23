// anonymous struct declarations
struct vecc;

// struct definitions
struct vecc {
  unsigned long len_poss_cap;
  unsigned long cap_poss_len;
  unsigned char **contents;
};

// function declarations
unsigned int !(unsigned int var0);
unsigned int != (unsigned long var0, unsigned long var1);
unsigned int != .2(unsigned char var0, unsigned char var1);
unsigned long && (unsigned long var0, unsigned long var1);
unsigned char && .7(unsigned char var0, unsigned char var1);
unsigned int && .9(unsigned int var0, unsigned int var1);
unsigned long *(unsigned long var0, unsigned long var1);
unsigned long + (unsigned long var0, unsigned long var1);
unsigned long - (unsigned long var0, unsigned long var1);
unsigned int < (unsigned long var0, unsigned long var1);
unsigned int < .3(unsigned char var0, unsigned char var1);
unsigned int <= (unsigned long var0, unsigned long var1);
unsigned int <= .5(unsigned char var0, unsigned char var1);
unsigned int == (unsigned long var0, unsigned long var1);
unsigned int == .1(unsigned char var0, unsigned char var1);
unsigned int > (unsigned long var0, unsigned long var1);
unsigned int > .4(unsigned char var0, unsigned char var1);
unsigned int >= (unsigned long var0, unsigned long var1);
unsigned int >= .6(unsigned char var0, unsigned char var1);
void append(struct vecc *var0, unsigned char *var1);
extern void exit(unsigned long var0);
extern void free(unsigned char *var0);
unsigned char **get(struct vecc *var0, unsigned long var1);
unsigned char **get .11(struct anonymous_struct0 *var0, unsigned long var1);
void main(void);
extern unsigned char *malloc(unsigned long var0);
extern void printf(unsigned char *var0);
extern void putchar(unsigned char var0);
extern unsigned char *realloc(unsigned char *var0, unsigned long var1);
void set(struct vecc *var0, unsigned long var1, unsigned char *var2);
extern unsigned long strcmp(unsigned char *var0, unsigned char *var1);
extern void strcpy(unsigned char *var0, unsigned char *var1);
extern unsigned long strlen(unsigned char *var0);
extern void strncpy(unsigned char *var0, unsigned char *var1,
                    unsigned long var2);
struct vecc variablearray #new(void);
unsigned long || (unsigned long var0, unsigned long var1);
unsigned int || .10(unsigned int var0, unsigned int var1);
unsigned char || .8(unsigned char var0, unsigned char var1);

// global variable definitions
unsigned char global_str[6] = {
    104, 101, 108, 108, 111, 0,
};
unsigned char global_str_12[4] = {
    114,
    117,
    110,
    0,
};

unsigned int !(unsigned int var0) {
  unsigned int var1;
block0:
  var1 = var0;
  return !var1;
}

unsigned int != (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 != var2;
}

unsigned int != .2(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 != var2;
}

unsigned long && (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 & var2;
}

unsigned char && .7(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 & var2;
}

unsigned int && .9(unsigned int var0, unsigned int var1) {
  unsigned int var2;
  unsigned int var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 & var2;
}

unsigned long *(unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 * var2;
}

unsigned long + (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 + var2;
}

unsigned long - (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 - var2;
}

unsigned int < (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 < var2;
}

unsigned int < .3(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 < var2;
}

unsigned int <= (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 <= var2;
}

unsigned int <= .5(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 <= var2;
}

unsigned int == (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 == var2;
}

unsigned int == .1(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 == var2;
}

unsigned int > (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 > var2;
}

unsigned int > .4(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 > var2;
}

unsigned int >= (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 >= var2;
}

unsigned int >= .6(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 >= var2;
}

void append(struct vecc *vector, unsigned char *var1) {
  unsigned char **var2;
  unsigned long var3;
  unsigned long var4;
  unsigned long one_plus_len_p;
  unsigned long var6;
  unsigned char *content;
  struct vecc *vector8;
  unsigned long *len_p;
  unsigned long deref_len;
  unsigned long *var11;
  unsigned long var12;
  unsigned char ***var13;
  struct vecc *var14;
block0:
  vector8 = vector;
  content = var1;
  len_p = (&(vector8->len_poss_cap));
  var6 = 1;
  one_plus_len_p = +(*len_p, var6);
  (*len_p) = one_plus_len_p;
  deref_len = (*len_p);
  if (>
      (*(vector8->len_poss_cap,
         (unsigned long)(&(*(((unsigned char **)((unsigned char **)0)) + 1)))),
       var8->cap_poss_len)) {
    var11 = (&(vector8->cap_poss_len));
    var4 =
        *((unsigned long)(&(*(((unsigned char **)((unsigned char **)0)) + 1))),
          64);
    var3 = +(*var11, var4);
    (*var11) = var3;
    var12 = (*var11);
    var13 = (&(vector8->contents));
    var2 = ((unsigned char **)realloc((unsigned char *)(vector8->contents),
                                      vector8->cap_poss_len));
    (*var13) = var2;
    goto block2;
  } else {
    goto block2;
  }
block2:
  var14 = vector8;
  set(var14, -(vector8->len_poss_cap, 1), content);
  return;
}

unsigned char **get(struct vecc *var0, unsigned long var1) {
  unsigned char **var2;
  unsigned long var3;
  struct vecc *var4;
block0:
  var4 = var0;
  var3 = var1;
  var2 = (var4->contents);
  return &(*(((unsigned char **)(var2)) + var3));
}

unsigned char **get .11(struct anonymous_struct0 *var0, unsigned long var1) {
  unsigned char **var2;
  unsigned long var3;
  struct anonymous_struct0 *var4;
block0:
  var4 = var0;
  var3 = var1;
  var2 = (var4->structVar2);
  return &(*(((unsigned char **)(var2)) + var3));
}

void main(void) {
  unsigned char *var0;
  unsigned char **var1;
  unsigned char **var2;
  struct anonymous_struct0 var3;
  struct anonymous_struct0 var4;
block0:
  var3 = variablearray #new ();
  var4 = var3;
  append(&var4, &(global_str[0]));
  var1 = get .11(&var4, 0);
  var2 = var1;
  var0 = var0;
  printf(var0);
  printf(&(global_str_12[0]));
  return;
}

void set(struct anonymous_struct0 *var0, unsigned long var1,
         unsigned char *var2) {
  unsigned char *var3;
  unsigned long var4;
  struct anonymous_struct0 *var5;
block0:
  var5 = var0;
  var4 = var1;
  var3 = var2;
  memcpy((unsigned char *)get(var5, var4), (unsigned char *)(&var3),
         (unsigned long)(&(*(((unsigned char **)((unsigned char **)0)) + 1))));
  return;
}

struct anonymous_struct0 variablearray #new(void) {
  unsigned long var0;
  unsigned long var1;
  unsigned char **var2;
  struct anonymous_struct0 var3;
  unsigned char ***var4;
  unsigned long *var5;
  unsigned long *var6;
block0:
  var4 = (&(var3.structVar2));
  var2 = ((unsigned char **)malloc(
      *((unsigned long)(&(*(((unsigned char **)((unsigned char **)0)) + 1))),
        64)));
  (*var4) = var2;
  var5 = (&(var3.structVar0));
  var1 = 0;
  (*var5) = var1;
  var6 = (&(var3.structVar1));
  var0 = *((unsigned long)(&(*(((unsigned char **)((unsigned char **)0)) + 1))),
           64);
  (*var6) = var0;
  return var3;
}

unsigned long || (unsigned long var0, unsigned long var1) {
  unsigned long var2;
  unsigned long var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 | var2;
}

unsigned int || .10(unsigned int var0, unsigned int var1) {
  unsigned int var2;
  unsigned int var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 | var2;
}

unsigned char || .8(unsigned char var0, unsigned char var1) {
  unsigned char var2;
  unsigned char var3;
block0:
  var3 = var0;
  var2 = var1;
  return var3 | var2;
}
