default:
	make clean
	make a.out

clean:
	-rm a.out silver.ll

a.out: silver.silver
	RUST_BACKTRACE=1 x silver.silver
	clang -g silver.ll helper.c
