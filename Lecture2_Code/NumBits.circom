pragma circom 2.1.4;

template Num2Bits (nBits) {
    signal input in;
    signal output b[nBits];

    var in_cal; 
    for(var i = 0; i < nBits; i++){
        b[i] <-- (in \ 2 ** i) % 2;  // 依次计算二进制的每一位并赋值
        0 === b[i] * (1 - b[i]);  // 约束二进制的每一位等于0或1 
        in_cal += b[i] * 2 ** i;  // 计算计算出的二进制表示对应的十进制表示
    }

    in === in_cal;  // 约束计算出的二进制结果等于输入
}

component main = Num2Bits(10);

/* INPUT = {
    "in": "1023"
} */
