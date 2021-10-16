#include <iostream>
#include <string>
using namespace std;

int main() {
    string a, b;
    cin >> a >> b;
    int s1=0, s2=0;
    for(const char c:a){
        s1 += c - '0';
    }
    for(const char c:b){
        s2 += c - '0';
    }

    cout<<(s1>s2?s1:s2)<<endl;
}