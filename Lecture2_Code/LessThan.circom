pragma circom 2.1.4;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

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

// in[0] - in[1] + MAX_Value 后判断高位数字
template LessThan () {
    signal input in[2];
    signal output out;

    component del_val = Num2Bits(253);  // 生成253位的二进制表示
    del_val.in <== in[0] - in[1] + (1<<252); // 右移252次，到第253位

    out <== 1 - del_val.b[252];
}

template LessEqThan(){
    signal input in[2];
    signal output out;

    component del_val = Num2Bits(253);
    del_val.in <== in[1] - in[0] + (1<<252);

    out <== del_val.b[252];  //小于等于时都输出1，大于时输出0
}

template GreaterThan(){
    signal input in[2];
    signal output out;

    component gt = LessThan();
    gt.in[0] <== in[1];
    ge.in[1] <== in[0];
    out <== gt.out;
}

template GreaterEqThan(){
    signal input in[2];
    signal output out;

    component gt = LessEqThan();
    gt.in[0] <== in[1];
    ge.in[1] <== in[0];
    out <== gt.out;
}

component main = LessThan();

/* INPUT = {
    "in":["2", "2"]
} */
