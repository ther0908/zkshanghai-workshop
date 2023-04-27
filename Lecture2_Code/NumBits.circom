pragma circom 2.1.4;

template Num2Bits (nBits) {
    signal input in;
    signal output b[nBits];

    var in_cal;
    for(var i = 0; i < nBits; i++){
        b[i] <-- (in \ 2 ** i) % 2;
        0 === b[i] * (1 - b[i]);
        in_cal += b[i] * 2 ** i;
    }

    in === in_cal;
}

component main = Num2Bits(10);

/* INPUT = {
    "in": "1023"
} */
