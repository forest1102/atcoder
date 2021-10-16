#include <iostream>
#include <string>
#include <unordered_set>

using namespace std;

int main() {
    int N;
    cin >> N;
    unordered_set< string > set;
    string res = "";
    for(int i = 0; i < N; ++i) {
        string s;
        cin >> s;
        if(s[0] == '!') {
            if(set.find(s.substr(1)) == set.end()) {
                set.insert(s);
            } else {
                res = (res != "" ? res : s.substr(1));
            }
        } else {
            if(set.find('!' + s) == set.end()) {
                set.insert(s);
            } else {
                res = (res != "" ? res : s);
            }
        }
    }
    cout << (res == "" ? "satisfiable" : res) << endl;
}