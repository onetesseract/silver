#include <fstream>
#include <iostream>
#include <parser.hpp>
#include <instruction.hpp>

using namespace std;

int main(int argc, char* argv[]) {
    cout << "hello" << endl;
    // from_string("hello");
    ifstream file { argv[argc - 1] };
    parser::Parser parser { file };
    parser.parse();
    return 0;
}
