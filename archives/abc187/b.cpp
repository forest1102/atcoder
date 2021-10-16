#include <iostream>
#include <vector>
using namespace std;
#define MAX 1000
int main() {
    int N;
    cin >> N;

    vector< pair< int, int > > points(N);

    for(auto &p : points) {
        cin >> p.first >> p.second;
    }
    int count = 0;
    for(int i = 0; i < N; ++i) {
        for(int j = i + 1; j < N; ++j) {
            count += (abs(points[j].first - points[i].first) >=
                      abs(points[j].second - points[i].second));
        }
    }
    cout << count << endl;
}