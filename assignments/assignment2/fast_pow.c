// assume both base number and exponent are integers
// assume exponent >= 0
long pow(long base, long exponent) {
    if (exponent == 0)
        return 1;
    long half = pow(base, exponent / 2);
    bool odd = exponent % 2;
    if (odd)
        return base * half * half;
    else
            return half * half;
}
