long g(long a, long b) {
    return a * b;
}

long f(long a, long b, long c) {
    long x = g(a, 2);
    long y = g(b, 5);
    return x + y;
}

int main() {
    long t = f(20, 23, 1);
    return 0;
}
