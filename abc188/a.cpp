#include <iostream>
using namespace std;

int main() {
    int a, b;
    cin >> a >> b;
    cout << (abs(a - b) < 3 ? "Yes" : "No") << endl;
}