pragma solidity ^0.4.24;

//Safe Math Interface

contract SafeMath {

    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }

    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }

    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


//ERC Token Standard #20 Interface

contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


//Contract function to receive approval and execute function in one call

contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}

//Actual token contract

contract YapeDaoToken is ERC20Interface, SafeMath {
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    constructor() public {
        symbol = "YAPE";
        name = "YAPE DAO TOKEN";
        decimals = 18;
        _totalSupply = 1000000000000000000000000000;
        balances[0x00000000009a41862f3b2b0c688b7c0d1940511e] = 1.10948E+25;
        balances[0x008c231f6db87828968a94710b6217e1d242e940] = 1073912000000000000000000;
        balances[0x04b936745c02e8cb75cc68b93b4fb99b38939d5d] = 149252000000000000000000;
        balances[0x055951c3bc52a98500a5861716c443544ecec837] = 844402000000000000000000;
        balances[0x09247bca14d8222d563668771c3eaa2830a61dc4] = 65899000000000000000000;
        balances[0x0aea144493cf4dfa4a8507b9254e8b4d2ba5e6f4] = 10861291000000000000000000;
        balances[0x0af2E76FF3E9a536C876bE3FA597Ee252A46e306] = 1.1E+25;
        balances[0x0cc45eb45fd260e649cf5751965997f64172dade] = 21208000000000000000000;
        balances[0x0d734a787dfbadf4916b858d939aae0a9eeef4e2] = 1.21789E+24;
        balances[0x0f31c85b58628c677089794f1923b5ab1d7d79b7] = 82000000000000000000;
        balances[0x13280523586511bb2cd333a82c2761d325a83e0e] = 4674306000000000000000000;
        balances[0x13b3a50f3947476eda74fe191344524e2d2d28e5] = 988000000000000000000;
        balances[0x1409bf7eb402c398f360cf5e037a3a674b3e602e] = 39760000000000000000000;
        balances[0x167F897440cfD5227F22349779841F83DdDA126a] = 1.42119E+25;
        balances[0x186e16cc466a6c03217f4b8fe615997f6b6e0651] = 1523074000000000000000000;
        balances[0x1ae6912e08bb3e105a4f0a60f666376d3c7af380] = 94670000000000000000000;
        balances[0x1f427a6fcdb95a7393c58552093e10a932890fa8] = 4313194000000000000000000;
        balances[0x1faacbb5b7b35daf5c1a95f20a5a527477dfa8c0] = 3378934000000000000000000;
        balances[0x21fa176515a141be959453e4fca0a42f3a5ceb26] = 100000000000000000000000;
        balances[0x240cf70d8a648be133feb342d71e5e81c686e5f8] = 1111111000000000000000000;
        balances[0x2572a193da3def3baea04cb18e06a52186ac1a98] = 17156000000000000000000;
        balances[0x25c13f9e208a9de36798a100165936f484a59d03] = 424742000000000000000000;
        balances[0x28ead95628610b4ee91408cfe1c225c71ab6e7a8] = 8301000000000000000000;
        balances[0x294d241950fb6c78fb936cb1610fb7452712f487] = 400000000000000000000;
        balances[0x2e5185e857597c5725c402107c9b652a04debce3] = 50121000000000000000000;
        balances[0x331eafa3f2b4973cb9ece3a884ccc3cb9c171ce7] = 114000000000000000000;
        balances[0x3323e4c51f4a819fe017c3aba9f8abbe4535d0ab] = 1.88727E+24;
        balances[0x3bbec29ab82db1f0be3f67261cc902c4e35ab70d] = 2222222000000000000000000;
        balances[0x3bd3ce01c82a12d7cff7c85a9e8bb27ae42fb548] = 147667000000000000000000;
        balances[0x3e3672b23eb22946a31263d2d178bf0fb1f4bbfd] = 296623000000000000000000;
        balances[0x40e952e47fe92cdef8751bc2ce7511d018665fe3] = 84373000000000000000000;
        balances[0x4146bf6509a74ed4e06fb705910339fd5633312f] = 28000000000000000000;
        balances[0x4229ebbf510af335a266b64bd2bdbc3e28ba29b8] = 2810084000000000000000000;
        balances[0x424411f75609375cdbead866a8e26615e8281802] = 1.18607E+25;
        balances[0x458129c4c58ec38d45b4274b2de2991b197f9d13] = 1669645000000000000000000;
        balances[0x46109814e431d2d7b17b14c6a8e3080e88d40c3c] = 1020000000000000000000;
        balances[0x4747a2e85527046b64ace68ac4f8ec1739df55ee] = 42000000000000000000;
        balances[0x494c114E30AddF163049b51dD347E717D94a5051] = 1.1E+25;
        balances[0x4adbf598af825b14db8c0c8fb4b3ed8b898e6364] = 2767000000000000000000;
        balances[0x4b9500be3f3896fa4ae391244965740d9a59f1d6] = 25210093000000000000000000;
        balances[0x4b9d53246ed18db31f26fc59b6e47a9efc3c1213] = 212625000000000000000000;
        balances[0x4faa84e3d99f95e0329e0a425031fb6e3aae004a] = 1323489000000000000000000;
        balances[0x504d72cd5422500acdb257192f3480388001ce0b] = 874000000000000000000;
        balances[0x50d5e77a1019b3bccccfdb3e0a9e145af43a9443] = 1111111000000000000000000;
        balances[0x51a0A3849F1Cc8822C2CbcA4E0ce9eE0bA8E481D] = 1.1E+25;
        balances[0x52a42429bdaad4396f128cb92167e64a96be8a61] = 3.70993E+24;
        balances[0x537bf75de19f3d229e3a9018ee1a23c0c9c7d39c] = 1170304000000000000000000;
        balances[0x544e3f54cad02f469e4038c235a459f62c9a06aa] = 1071654000000000000000000;
        balances[0x5692d0e48ee8deb38ef22420807f7638b6042dff] = 1346000000000000000000;
        balances[0x5b066789f1323c2c6100b8a04c5c23b149212dc7] = 11111000000000000000000;
        balances[0x5dc268b16f734a112423c78588e47be27c1aa85c] = 34272000000000000000000;
        balances[0x60203b2d05f84baf615095596c4353ff11d2a407] = 1039000000000000000000;
        balances[0x670120d4833633466c7db4b515c53fa8c5b33b97] = 7022523000000000000000000;
        balances[0x67a66de57a6bd2f614a58de04b873bf421d399d3] = 1994000000000000000000;
        balances[0x6db7424be3298b0081af4e698f828c57b68f4a2b] = 4637672000000000000000000;
        balances[0x70299f32683e4dee59f96e37c95bbff2f39cfbf2] = 2847000000000000000000;
        balances[0x741b875253299a60942e1e7512a79bbbf9a747d7] = 34101000000000000000000;
        balances[0x778fa27f4dd25bf00c919fbd39d07f50450cf995] = 129610000000000000000000;
        balances[0x77dd52c08f4aaa9da42ed1bf2e738b8969ab980f] = 10077568000000000000000000;
        balances[0x77f6821146cce5993282d940eef472c4b09d7537] = 43594000000000000000000;
        balances[0x77fa39f3adf09bde9d4f175e40d0854d21a33318] = 13204495000000000000000000;
        balances[0x7d0d5093d8dd36d34eecaa995a899cc2f6fe1420] = 3519669000000000000000000;
        balances[0x7f5d1970c474dac277c9a8c44214ac89cdab9b39] = 1.41389E+24;
        balances[0x8059234ad4d6720da8500cf88e2fd7a635595f45] = 2309522000000000000000000;
        balances[0x839f099d7ea3c0a323e4633237b18694af245c5a] = 16626000000000000000000;
        balances[0x889fe3d86adec4558badcfb24656d5f8a3ec8620] = 17198000000000000000000;
        balances[0x8992a8a9a47e2f856c0d099fb9b72e3d0e1f8bce] = 15815541000000000000000000;
        balances[0x89b8b20ae90328692cd367f75aafadf55fd33e8b] = 5534355000000000000000000;
        balances[0x89dbb66a9a2697914a3838467f767fcdbe5ca723] = 18514000000000000000000;
        balances[0x8ae8c1aad2e5e80bb3a714f62eff37a8383a9988] = 1376000000000000000000;
        balances[0x8da35b920fe236a757a0fad93d3a3ab8ea0a24cc] = 110404000000000000000000;
        balances[0x8e9c4dfc2fceea58b97b0946ef5998a2786914b9] = 23181205000000000000000000;
        balances[0x902aca16fcab57c565ea472df1549e0f57a17813] = 2065127000000000000000000;
        balances[0x975157fa98d07b115e1c293fcc31897ab51723ca] = 44444000000000000000000;
        balances[0x99967e073430a433b1ee1a3c003790d48db13a55] = 201657000000000000000000;
        balances[0x9ca10fe0ccc43d8464e91938e56411e6ecfb8e2d] = 4212000000000000000000;
        balances[0x9e9897e5ac81ac05bfa25c55acef90ef094834a9] = 2083913000000000000000000;
        balances[0xa5d40a9a0041f07e98cc1c2ad8bc4e6a82c7d792] = 6694000000000000000000;
        balances[0xa812cecfcd5c4ec834390fc2f0ba052d645299ae] = 849000000000000000000;
        balances[0xaaeb6ca7fdf98c1284592749e9161a3c885f59bd] = 96728000000000000000000;
        balances[0xad194a32698f86181c8222bd1f379086d09296f7] = 6278000000000000000000;
        balances[0xaeab53157dc9b0eb7b0f931cea270ece5da087b0] = 1080636000000000000000000;
        balances[0xb1bd14af5a0de98979cd24c77a8fb5ec0b59c61c] = 4769000000000000000000;
        balances[0xb6bbE5a785F6cfEd3F65F2BA91AD20586B00f7E6] = 1.13259E+25;
        balances[0xb7d49adb031d6dbdf3e8e28f21c6dd3b6f231cd5] = 3681000000000000000000;
        balances[0xb941f9b7566e7108332a9ec187d222a1cc05e422] = 11000000000000000000;
        balances[0xB952C200b8115Be7F38037e98f268c509d4646Ab] = 1.11704E+25;
        balances[0xba9366ce37aa833eab8f12d599977a16e470e34e] = 5.00485E+24;
        balances[0xbad2e065edc215cb54a0e78391fb2abcb173f77d] = 3.46091E+25;
        balances[0xbcb0dadeeb62f0a814b9fe2425e1315398eb66e6] = 3.67617E+24;
        balances[0xbd9425dd654dbb1e1804430df5723c279a0a86b7] = 100000000000000000000000;
        balances[0xbf2b96a8c630444e3905c48d57207376156bdee0] = 147249000000000000000000;
        balances[0xc1c3f882430a73046a0efb3081cd56a123cac69a] = 7343000000000000000000;
        balances[0xc3812ae9afd34b26b7a8aeeef8798d770505f169] = 5907056000000000000000000;
        balances[0xc561c9b7035732b4ebdbae6ac43d6a293ab53896] = 6.30201E+24;
        balances[0xc89ce9f096ddb405359b22a4863a08e8828e88d7] = 187312000000000000000000;
        balances[0xc8cb17a12f8852f4d8c91803352790eb9f39f875] = 690000000000000000000;
        balances[0xc90923827d774955dc6798fff540c4e2d29f2dbe] = 18625000000000000000000;
        balances[0xc93678ec2b974a7ae280341cefeb85984a29fff7] = 1.99385E+23;
        balances[0xce5882545db8a67016e87c6f72543d057b885c58] = 221140000000000000000000;
        balances[0xcf9539f92930b5d692eaa6fc33ff3e55b5c49550] = 4195785000000000000000000;
        balances[0xd03a083589edc2accf09593951dcf000475cc9f2] = 3242000000000000000000;
        balances[0xd3eb5537c349781f483bb556b3b1371a442338fc] = 2247465000000000000000000;
        balances[0xd3f1d20c54ca62b50de97a946e945941bf6a160d] = 1361515000000000000000000;
        balances[0xd8965d4fabfa616110ac8737c74f5e4948c6d952] = 5148263000000000000000000;
        balances[0xd8ab31a65dada7e20f87660cff44fff13d30ca5a] = 434495000000000000000000;
        balances[0xd93ec7e214c50fe64050d0a88002942f0e242659] = 205468000000000000000000;
        balances[0xdbd2ea8b3bb0f0f75f898b2964df93f632353b5c] = 60142000000000000000000;
        balances[0xddab1789e401a41251ae4ca43644c467232a2889] = 1.26919E+24;
        balances[0xdec08cb92a506b88411da9ba290f3694be223c26] = 160000000000000000000;
        balances[0xe04046b4e097615d18f26b3fb4f383aec5435ed1] = 24757000000000000000000;
        balances[0xe1362a7b4749a63f011c76d7e2cf5f030089917f] = 4507021000000000000000000;
        balances[0xe2bc819b52ae921248f44b2d5c2dde93b731ce4e] = 4021020000000000000000000;
        balances[0xe3cf153c4d56c0b642cc5111ae6db2c758d46445] = 845724000000000000000000;
        balances[0xe75fe8be89d97101d1d84878bb876a1e6b12b83e] = 6.73463E+23;
        balances[0xe8c5425366a9757b1ac37adfa011703f24c08a96] = 8.78635E+24;
        balances[0xe81119bcf92Fa4E9234690Df8ad2F35896988A71] = 2.31062E+24;
        balances[0xec37c526d008a9e3f119dda74937ef628e693947] = 1.17603E+25;
        balances[0xeca63b971df1a9aa20b1250185f8ac0755fa7a82] = 26136000000000000000000;
        balances[0xf2fb34c4323f9bf4a5c04fe277f96588dde5316f] = 1128346000000000000000000;
        balances[0xf3db3ec867909e07f284f79d6c6812cbc992f861] = 1.10923E+25;
        balances[0xfaae9a903469883d7a2dbace1a53ecd7e7949f52] = 3886295000000000000000000;
        balances[0xfe5e2e83e966865d61bacd8dfc10ac73db222640] = 366184000000000000000000;
        balances[0xfebd639a8f497cf56b17c77d5a80a3fd67b73834] = 46740000000000000000000;
        balances[0x8992a8A9a47e2f856C0D099fb9B72e3d0e1F8bce] = 620912506000000000000000000;
        
        emit Transfer(address(0), 0x00000000009a41862f3b2b0c688b7c0d1940511e, 1.10948E+25);
        emit Transfer(address(1), 0x008c231f6db87828968a94710b6217e1d242e940, 1073912000000000000000000);
        emit Transfer(address(2), 0x04b936745c02e8cb75cc68b93b4fb99b38939d5d, 149252000000000000000000);
        emit Transfer(address(3), 0x055951c3bc52a98500a5861716c443544ecec837, 844402000000000000000000);
        emit Transfer(address(4), 0x09247bca14d8222d563668771c3eaa2830a61dc4, 65899000000000000000000);
        emit Transfer(address(5), 0x0aea144493cf4dfa4a8507b9254e8b4d2ba5e6f4, 10861291000000000000000000);
        emit Transfer(address(6), 0x0af2E76FF3E9a536C876bE3FA597Ee252A46e306, 1.1E+25);
        emit Transfer(address(7), 0x0cc45eb45fd260e649cf5751965997f64172dade, 21208000000000000000000);
        emit Transfer(address(8), 0x0d734a787dfbadf4916b858d939aae0a9eeef4e2, 1.21789E+24);
        emit Transfer(address(9), 0x0f31c85b58628c677089794f1923b5ab1d7d79b7, 82000000000000000000);
        emit Transfer(address(10), 0x13280523586511bb2cd333a82c2761d325a83e0e, 4674306000000000000000000);
        emit Transfer(address(11), 0x13b3a50f3947476eda74fe191344524e2d2d28e5, 988000000000000000000);
        emit Transfer(address(12), 0x1409bf7eb402c398f360cf5e037a3a674b3e602e, 39760000000000000000000);
        emit Transfer(address(13), 0x167F897440cfD5227F22349779841F83DdDA126a, 1.42119E+25);
        emit Transfer(address(14), 0x186e16cc466a6c03217f4b8fe615997f6b6e0651, 1523074000000000000000000);
        emit Transfer(address(15), 0x1ae6912e08bb3e105a4f0a60f666376d3c7af380, 94670000000000000000000);
        emit Transfer(address(16), 0x1f427a6fcdb95a7393c58552093e10a932890fa8, 4313194000000000000000000);
        emit Transfer(address(17), 0x1faacbb5b7b35daf5c1a95f20a5a527477dfa8c0, 3378934000000000000000000);
        emit Transfer(address(18), 0x21fa176515a141be959453e4fca0a42f3a5ceb26, 100000000000000000000000);
        emit Transfer(address(19), 0x240cf70d8a648be133feb342d71e5e81c686e5f8, 1111111000000000000000000);
        emit Transfer(address(20), 0x2572a193da3def3baea04cb18e06a52186ac1a98, 17156000000000000000000);
        emit Transfer(address(21), 0x25c13f9e208a9de36798a100165936f484a59d03, 424742000000000000000000);
        emit Transfer(address(22), 0x28ead95628610b4ee91408cfe1c225c71ab6e7a8, 8301000000000000000000);
        emit Transfer(address(23), 0x294d241950fb6c78fb936cb1610fb7452712f487, 400000000000000000000);
        emit Transfer(address(24), 0x2e5185e857597c5725c402107c9b652a04debce3, 50121000000000000000000);
        emit Transfer(address(25), 0x331eafa3f2b4973cb9ece3a884ccc3cb9c171ce7, 114000000000000000000);
        emit Transfer(address(26), 0x3323e4c51f4a819fe017c3aba9f8abbe4535d0ab, 1.88727E+24);
        emit Transfer(address(27), 0x3bbec29ab82db1f0be3f67261cc902c4e35ab70d, 2222222000000000000000000);
        emit Transfer(address(28), 0x3bd3ce01c82a12d7cff7c85a9e8bb27ae42fb548, 147667000000000000000000);
        emit Transfer(address(29), 0x3e3672b23eb22946a31263d2d178bf0fb1f4bbfd, 296623000000000000000000);
        emit Transfer(address(30), 0x40e952e47fe92cdef8751bc2ce7511d018665fe3, 84373000000000000000000);
        emit Transfer(address(31), 0x4146bf6509a74ed4e06fb705910339fd5633312f, 28000000000000000000);
        emit Transfer(address(32), 0x4229ebbf510af335a266b64bd2bdbc3e28ba29b8, 2810084000000000000000000);
        emit Transfer(address(33), 0x424411f75609375cdbead866a8e26615e8281802, 1.18607E+25);
        emit Transfer(address(34), 0x458129c4c58ec38d45b4274b2de2991b197f9d13, 1669645000000000000000000);
        emit Transfer(address(35), 0x46109814e431d2d7b17b14c6a8e3080e88d40c3c, 1020000000000000000000);
        emit Transfer(address(36), 0x4747a2e85527046b64ace68ac4f8ec1739df55ee, 42000000000000000000);
        emit Transfer(address(37), 0x494c114E30AddF163049b51dD347E717D94a5051, 1.1E+25);
        emit Transfer(address(38), 0x4adbf598af825b14db8c0c8fb4b3ed8b898e6364, 2767000000000000000000);
        emit Transfer(address(39), 0x4b9500be3f3896fa4ae391244965740d9a59f1d6, 25210093000000000000000000);
        emit Transfer(address(40), 0x4b9d53246ed18db31f26fc59b6e47a9efc3c1213, 212625000000000000000000);
        emit Transfer(address(41), 0x4faa84e3d99f95e0329e0a425031fb6e3aae004a, 1323489000000000000000000);
        emit Transfer(address(42), 0x504d72cd5422500acdb257192f3480388001ce0b, 874000000000000000000);
        emit Transfer(address(43), 0x50d5e77a1019b3bccccfdb3e0a9e145af43a9443, 1111111000000000000000000);
        emit Transfer(address(44), 0x51a0A3849F1Cc8822C2CbcA4E0ce9eE0bA8E481D, 1.1E+25);
        emit Transfer(address(45), 0x52a42429bdaad4396f128cb92167e64a96be8a61, 3.70993E+24);
        emit Transfer(address(46), 0x537bf75de19f3d229e3a9018ee1a23c0c9c7d39c, 1170304000000000000000000);
        emit Transfer(address(47), 0x544e3f54cad02f469e4038c235a459f62c9a06aa, 1071654000000000000000000);
        emit Transfer(address(48), 0x5692d0e48ee8deb38ef22420807f7638b6042dff, 1346000000000000000000);
        emit Transfer(address(49), 0x5b066789f1323c2c6100b8a04c5c23b149212dc7, 11111000000000000000000);
        emit Transfer(address(50), 0x5dc268b16f734a112423c78588e47be27c1aa85c, 34272000000000000000000);
        emit Transfer(address(51), 0x60203b2d05f84baf615095596c4353ff11d2a407, 1039000000000000000000);
        emit Transfer(address(52), 0x670120d4833633466c7db4b515c53fa8c5b33b97, 7022523000000000000000000);
        emit Transfer(address(53), 0x67a66de57a6bd2f614a58de04b873bf421d399d3, 1994000000000000000000);
        emit Transfer(address(54), 0x6db7424be3298b0081af4e698f828c57b68f4a2b, 4637672000000000000000000);
        emit Transfer(address(55), 0x70299f32683e4dee59f96e37c95bbff2f39cfbf2, 2847000000000000000000);
        emit Transfer(address(56), 0x741b875253299a60942e1e7512a79bbbf9a747d7, 34101000000000000000000);
        emit Transfer(address(57), 0x778fa27f4dd25bf00c919fbd39d07f50450cf995, 129610000000000000000000);
        emit Transfer(address(58), 0x77dd52c08f4aaa9da42ed1bf2e738b8969ab980f, 10077568000000000000000000);
        emit Transfer(address(59), 0x77f6821146cce5993282d940eef472c4b09d7537, 43594000000000000000000);
        emit Transfer(address(60), 0x77fa39f3adf09bde9d4f175e40d0854d21a33318, 13204495000000000000000000);
        emit Transfer(address(61), 0x7d0d5093d8dd36d34eecaa995a899cc2f6fe1420, 3519669000000000000000000);
        emit Transfer(address(62), 0x7f5d1970c474dac277c9a8c44214ac89cdab9b39, 1.41389E+24);
        emit Transfer(address(63), 0x8059234ad4d6720da8500cf88e2fd7a635595f45, 2309522000000000000000000);
        emit Transfer(address(64), 0x839f099d7ea3c0a323e4633237b18694af245c5a, 16626000000000000000000);
        emit Transfer(address(65), 0x889fe3d86adec4558badcfb24656d5f8a3ec8620, 17198000000000000000000);
        emit Transfer(address(66), 0x8992a8a9a47e2f856c0d099fb9b72e3d0e1f8bce, 15815541000000000000000000);
        emit Transfer(address(67), 0x89b8b20ae90328692cd367f75aafadf55fd33e8b, 5534355000000000000000000);
        emit Transfer(address(68), 0x89dbb66a9a2697914a3838467f767fcdbe5ca723, 18514000000000000000000);
        emit Transfer(address(69), 0x8ae8c1aad2e5e80bb3a714f62eff37a8383a9988, 1376000000000000000000);
        emit Transfer(address(70), 0x8da35b920fe236a757a0fad93d3a3ab8ea0a24cc, 110404000000000000000000);
        emit Transfer(address(71), 0x8e9c4dfc2fceea58b97b0946ef5998a2786914b9, 23181205000000000000000000);
        emit Transfer(address(72), 0x902aca16fcab57c565ea472df1549e0f57a17813, 2065127000000000000000000);
        emit Transfer(address(73), 0x975157fa98d07b115e1c293fcc31897ab51723ca, 44444000000000000000000);
        emit Transfer(address(74), 0x99967e073430a433b1ee1a3c003790d48db13a55, 201657000000000000000000);
        emit Transfer(address(75), 0x9ca10fe0ccc43d8464e91938e56411e6ecfb8e2d, 4212000000000000000000);
        emit Transfer(address(76), 0x9e9897e5ac81ac05bfa25c55acef90ef094834a9, 2083913000000000000000000);
        emit Transfer(address(77), 0xa5d40a9a0041f07e98cc1c2ad8bc4e6a82c7d792, 6694000000000000000000);
        emit Transfer(address(78), 0xa812cecfcd5c4ec834390fc2f0ba052d645299ae, 849000000000000000000);
        emit Transfer(address(79), 0xaaeb6ca7fdf98c1284592749e9161a3c885f59bd, 96728000000000000000000);
        emit Transfer(address(80), 0xad194a32698f86181c8222bd1f379086d09296f7, 6278000000000000000000);
        emit Transfer(address(81), 0xaeab53157dc9b0eb7b0f931cea270ece5da087b0, 1080636000000000000000000);
        emit Transfer(address(82), 0xb1bd14af5a0de98979cd24c77a8fb5ec0b59c61c, 4769000000000000000000);
        emit Transfer(address(83), 0xb6bbE5a785F6cfEd3F65F2BA91AD20586B00f7E6, 1.13259E+25);
        emit Transfer(address(84), 0xb7d49adb031d6dbdf3e8e28f21c6dd3b6f231cd5, 3681000000000000000000);
        emit Transfer(address(85), 0xb941f9b7566e7108332a9ec187d222a1cc05e422, 11000000000000000000);
        emit Transfer(address(86), 0xB952C200b8115Be7F38037e98f268c509d4646Ab, 1.11704E+25);
        emit Transfer(address(87), 0xba9366ce37aa833eab8f12d599977a16e470e34e, 5.00485E+24);
        emit Transfer(address(88), 0xbad2e065edc215cb54a0e78391fb2abcb173f77d, 3.46091E+25);
        emit Transfer(address(89), 0xbcb0dadeeb62f0a814b9fe2425e1315398eb66e6, 3.67617E+24);
        emit Transfer(address(90), 0xbd9425dd654dbb1e1804430df5723c279a0a86b7, 100000000000000000000000);
        emit Transfer(address(91), 0xbf2b96a8c630444e3905c48d57207376156bdee0, 147249000000000000000000);
        emit Transfer(address(92), 0xc1c3f882430a73046a0efb3081cd56a123cac69a, 7343000000000000000000);
        emit Transfer(address(93), 0xc3812ae9afd34b26b7a8aeeef8798d770505f169, 5907056000000000000000000);
        emit Transfer(address(94), 0xc561c9b7035732b4ebdbae6ac43d6a293ab53896, 6.30201E+24);
        emit Transfer(address(95), 0xc89ce9f096ddb405359b22a4863a08e8828e88d7, 187312000000000000000000);
        emit Transfer(address(96), 0xc8cb17a12f8852f4d8c91803352790eb9f39f875, 690000000000000000000);
        emit Transfer(address(97), 0xc90923827d774955dc6798fff540c4e2d29f2dbe, 18625000000000000000000);
        emit Transfer(address(98), 0xc93678ec2b974a7ae280341cefeb85984a29fff7, 1.99385E+23);
        emit Transfer(address(99), 0xce5882545db8a67016e87c6f72543d057b885c58, 221140000000000000000000);
        emit Transfer(address(100), 0xcf9539f92930b5d692eaa6fc33ff3e55b5c49550, 4195785000000000000000000);
        emit Transfer(address(101), 0xd03a083589edc2accf09593951dcf000475cc9f2, 3242000000000000000000);
        emit Transfer(address(102), 0xd3eb5537c349781f483bb556b3b1371a442338fc, 2247465000000000000000000);
        emit Transfer(address(103), 0xd3f1d20c54ca62b50de97a946e945941bf6a160d, 1361515000000000000000000);
        emit Transfer(address(104), 0xd8965d4fabfa616110ac8737c74f5e4948c6d952, 5148263000000000000000000);
        emit Transfer(address(105), 0xd8ab31a65dada7e20f87660cff44fff13d30ca5a, 434495000000000000000000);
        emit Transfer(address(106), 0xd93ec7e214c50fe64050d0a88002942f0e242659, 205468000000000000000000);
        emit Transfer(address(107), 0xdbd2ea8b3bb0f0f75f898b2964df93f632353b5c, 60142000000000000000000);
        emit Transfer(address(108), 0xddab1789e401a41251ae4ca43644c467232a2889, 1.26919E+24);
        emit Transfer(address(109), 0xdec08cb92a506b88411da9ba290f3694be223c26, 160000000000000000000);
        emit Transfer(address(110), 0xe04046b4e097615d18f26b3fb4f383aec5435ed1, 24757000000000000000000);
        emit Transfer(address(111), 0xe1362a7b4749a63f011c76d7e2cf5f030089917f, 4507021000000000000000000);
        emit Transfer(address(112), 0xe2bc819b52ae921248f44b2d5c2dde93b731ce4e, 4021020000000000000000000);
        emit Transfer(address(113), 0xe3cf153c4d56c0b642cc5111ae6db2c758d46445, 845724000000000000000000);
        emit Transfer(address(114), 0xe75fe8be89d97101d1d84878bb876a1e6b12b83e, 6.73463E+23);
        emit Transfer(address(115), 0xe8c5425366a9757b1ac37adfa011703f24c08a96, 8.78635E+24);
        emit Transfer(address(116), 0xe81119bcf92Fa4E9234690Df8ad2F35896988A71, 2.31062E+24);
        emit Transfer(address(117), 0xec37c526d008a9e3f119dda74937ef628e693947, 1.17603E+25);
        emit Transfer(address(118), 0xeca63b971df1a9aa20b1250185f8ac0755fa7a82, 26136000000000000000000);
        emit Transfer(address(119), 0xf2fb34c4323f9bf4a5c04fe277f96588dde5316f, 1128346000000000000000000);
        emit Transfer(address(120), 0xf3db3ec867909e07f284f79d6c6812cbc992f861, 1.10923E+25);
        emit Transfer(address(121), 0xfaae9a903469883d7a2dbace1a53ecd7e7949f52, 3886295000000000000000000);
        emit Transfer(address(122), 0xfe5e2e83e966865d61bacd8dfc10ac73db222640, 366184000000000000000000);
        emit Transfer(address(123), 0xfebd639a8f497cf56b17c77d5a80a3fd67b73834, 46740000000000000000000);
        emit Transfer(address(124), 0x8992a8A9a47e2f856C0D099fb9B72e3d0e1F8bce, 620912506000000000000000000);






    }

    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }

    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }

    function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
        return true;
    }

    function () public payable {
        revert();
    }
}
