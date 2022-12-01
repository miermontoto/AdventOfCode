// Advent of Code 2022, day 1

#include <iostream>
#include <fstream>
#include <string>
#include <numeric>

using namespace std;

#define INPUT_FILE "input/1"
#define TOP_ELVES 3

int star_one();
int star_two();

int main() {
    cout << "star 1: " << star_one() << endl;
    cout << "star 2: " << star_two() << endl;
}

int star_one() {
    int max = 0;
    int sum = 0;

    ifstream input(INPUT_FILE);
    string line;
    while (getline(input, line)) {
        try {
            sum += stoi(line);
        } catch (invalid_argument e) {
            max = max > sum ? max : sum;
            sum = 0;
        }
    }

    return max;
}

int star_two() {
    int sum = 0;
    int top [TOP_ELVES] = { };
    int tmp;

    ifstream input(INPUT_FILE);
    string line;
    while (getline(input, line)) {
        try {
            sum += stoi(line);
        } catch (invalid_argument e) {
            for(int i = 0; i < TOP_ELVES; i++) {
                if (sum > top[i]) {
                    tmp = top[i];
                    top[i] = sum;
                    sum = tmp;
                }
            }

            sum = 0;
        }
    }

    return accumulate(top, top + TOP_ELVES, 0);
}
