#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    cin >> n;
    vector< int > a(n);
    for(auto &a_i : a) {
        cin >> a_i;
    }

    vector< int > b(n);
    for(auto &b_i : b) {
        cin >> b_i;
    }

    int dot = 0;
    for(int i = 0; i < n; ++i) {
        dot += a[i] * b[i];
    }

    cout << (dot == 0 ? "Yes" : "No") << endl;
}