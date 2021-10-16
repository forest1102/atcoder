#include <iostream>
#include <vector>

using namespace std;

int main() {
    int N;
    unsigned int S, D;
    cin >> N >> S >> D;

    bool can_attack = false;
    for(int i = 0; i < N; i++) {
        unsigned int x, y;
        cin >> x >> y;
        can_attack = can_attack || (x < S && y > D);
    }
    cout << (can_attack ? "Yes" : "No") << endl;
}