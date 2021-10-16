#include <iostream>

int main() {
    char str[3];
    std::cin >> str;
    std::cout << (str[0] == str[1] && str[1] == str[2] ? "Won" : "Lost")
              << std::endl;
}