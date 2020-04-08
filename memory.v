module memory (
    input wire clk,
    input wire rst_n,
    input wire [15:0] addr,
    input wire [15:0] data_in,
    input wire we,
    output wire [15:0] data_out
);

    reg [7:0] mem [65535:0];

    integer i;

    always @(posedge clk) begin
        if(!rst_n) begin
            for(i=0;i<65536;i=i+1)
                mem[i]<=8'h0;
            //init
            for(i=0;i<15138;i=i+1)
                mem[i]<=8'hff;

mem[10734] <= 8'd68;
mem[10735] <= 8'd0;
mem[10562] <= 8'd68;
mem[10563] <= 8'd0;
mem[10574] <= 8'd114;
mem[10575] <= 8'd0;
mem[11778] <= 8'd114;
mem[11779] <= 8'd0;
mem[11804] <= 8'd35;
mem[11805] <= 8'd0;
mem[12836] <= 8'd35;
mem[12837] <= 8'd0;
mem[12846] <= 8'd53;
mem[12847] <= 8'd0;
mem[12674] <= 8'd53;
mem[12675] <= 8'd0;
mem[12670] <= 8'd18;
mem[12671] <= 8'd0;
mem[12498] <= 8'd18;
mem[12499] <= 8'd0;
mem[12494] <= 8'd177;
mem[12495] <= 8'd0;
mem[12322] <= 8'd177;
mem[12323] <= 8'd0;
mem[12318] <= 8'd121;
mem[12319] <= 8'd0;
mem[12146] <= 8'd121;
mem[12147] <= 8'd0;
mem[12142] <= 8'd204;
mem[12143] <= 8'd1;
mem[11970] <= 8'd204;
mem[11971] <= 8'd1;
mem[11984] <= 8'd169;
mem[11985] <= 8'd0;
mem[13360] <= 8'd169;
mem[13361] <= 8'd0;
mem[10558] <= 8'd100;
mem[10559] <= 8'd0;
mem[10386] <= 8'd100;
mem[10387] <= 8'd0;
mem[10412] <= 8'd78;
mem[10413] <= 8'd0;
mem[12820] <= 8'd78;
mem[12821] <= 8'd0;
mem[12826] <= 8'd89;
mem[12827] <= 8'd0;
mem[10934] <= 8'd89;
mem[10935] <= 8'd0;
mem[12508] <= 8'd95;
mem[12509] <= 8'd0;
mem[13540] <= 8'd95;
mem[13541] <= 8'd0;
mem[13538] <= 8'd126;
mem[13539] <= 8'd0;
mem[12334] <= 8'd126;
mem[12335] <= 8'd0;
mem[12348] <= 8'd239;
mem[12349] <= 8'd0;
mem[14756] <= 8'd239;
mem[14757] <= 8'd0;
mem[12858] <= 8'd57;
mem[12859] <= 8'd0;
mem[13718] <= 8'd57;
mem[13719] <= 8'd0;
mem[13698] <= 8'd41;
mem[13699] <= 8'd0;
mem[11118] <= 8'd41;
mem[11119] <= 8'd0;
mem[11784] <= 8'd17;
mem[11785] <= 8'd0;
mem[11096] <= 8'd17;
mem[11097] <= 8'd0;
mem[11080] <= 8'd58;
mem[11081] <= 8'd0;
mem[10392] <= 8'd58;
mem[10393] <= 8'd0;
mem[10376] <= 8'd204;
mem[10377] <= 8'd0;
mem[9688] <= 8'd204;
mem[9689] <= 8'd0;
mem[9652] <= 8'd76;
mem[9653] <= 8'd0;
mem[7244] <= 8'd76;
mem[7245] <= 8'd0;
mem[12644] <= 8'd61;
mem[12645] <= 8'd0;
mem[10236] <= 8'd61;
mem[10237] <= 8'd0;
mem[10200] <= 8'd21;
mem[10201] <= 8'd1;
mem[9512] <= 8'd21;
mem[9513] <= 8'd1;
mem[9476] <= 8'd88;
mem[9477] <= 8'd0;
mem[7068] <= 8'd88;
mem[7069] <= 8'd0;
mem[9534] <= 8'd77;
mem[9535] <= 8'd1;
mem[12114] <= 8'd77;
mem[12115] <= 8'd1;
mem[10532] <= 8'd99;
mem[10533] <= 8'd0;
mem[8124] <= 8'd99;
mem[8125] <= 8'd0;
mem[8090] <= 8'd7;
mem[8091] <= 8'd0;
mem[7574] <= 8'd7;
mem[7575] <= 8'd0;
mem[7552] <= 8'd48;
mem[7553] <= 8'd0;
mem[6176] <= 8'd48;
mem[6177] <= 8'd0;
mem[6162] <= 8'd52;
mem[6163] <= 8'd0;
mem[6334] <= 8'd52;
mem[6335] <= 8'd0;
mem[10726] <= 8'd13;
mem[10727] <= 8'd0;
mem[9866] <= 8'd13;
mem[9867] <= 8'd0;
mem[9840] <= 8'd13;
mem[9841] <= 8'd0;
mem[8464] <= 8'd13;
mem[8465] <= 8'd0;
mem[8444] <= 8'd77;
mem[8445] <= 8'd0;
mem[8100] <= 8'd77;
mem[8101] <= 8'd0;
mem[7566] <= 8'd225;
mem[7567] <= 8'd0;
mem[7394] <= 8'd225;
mem[7395] <= 8'd0;
mem[7390] <= 8'd47;
mem[7391] <= 8'd0;
mem[7218] <= 8'd47;
mem[7219] <= 8'd0;
mem[7214] <= 8'd99;
mem[7215] <= 8'd0;
mem[7042] <= 8'd99;
mem[7043] <= 8'd0;
mem[7038] <= 8'd228;
mem[7039] <= 8'd3;
mem[6866] <= 8'd228;
mem[6867] <= 8'd3;
mem[6862] <= 8'd11;
mem[6863] <= 8'd1;
mem[6690] <= 8'd11;
mem[6691] <= 8'd1;
mem[6680] <= 8'd111;
mem[6681] <= 8'd1;
mem[5992] <= 8'd111;
mem[5993] <= 8'd1;
mem[5970] <= 8'd117;
mem[5971] <= 8'd0;
mem[4766] <= 8'd117;
mem[4767] <= 8'd0;
mem[4736] <= 8'd133;
mem[4737] <= 8'd0;
mem[3360] <= 8'd133;
mem[3361] <= 8'd0;
mem[4764] <= 8'd182;
mem[4765] <= 8'd0;
mem[5796] <= 8'd182;
mem[5797] <= 8'd0;
mem[5810] <= 8'd95;
mem[5811] <= 8'd0;
mem[5982] <= 8'd95;
mem[5983] <= 8'd0;
mem[6676] <= 8'd234;
mem[6677] <= 8'd0;
mem[5644] <= 8'd234;
mem[5645] <= 8'd0;
mem[8450] <= 8'd9;
mem[8451] <= 8'd0;
mem[8622] <= 8'd9;
mem[8623] <= 8'd0;
mem[8626] <= 8'd34;
mem[8627] <= 8'd0;
mem[8798] <= 8'd34;
mem[8799] <= 8'd0;
mem[7192] <= 8'd69;
mem[7193] <= 8'd0;
mem[5128] <= 8'd69;
mem[5129] <= 8'd0;
mem[5098] <= 8'd47;
mem[5099] <= 8'd1;
mem[4582] <= 8'd47;
mem[4583] <= 8'd1;
mem[5102] <= 8'd111;
mem[5103] <= 8'd0;
mem[4930] <= 8'd111;
mem[4931] <= 8'd0;
mem[7018] <= 8'd99;
mem[7019] <= 8'd0;
mem[5126] <= 8'd99;
mem[5127] <= 8'd0;
mem[5076] <= 8'd212;
mem[5077] <= 8'd0;
mem[2668] <= 8'd212;
mem[2669] <= 8'd0;
mem[2630] <= 8'd97;
mem[2631] <= 8'd2;
mem[1770] <= 8'd97;
mem[1771] <= 8'd2;
mem[9654] <= 8'd39;
mem[9655] <= 8'd0;
mem[7418] <= 8'd39;
mem[7419] <= 8'd0;
mem[7354] <= 8'd3;
mem[7355] <= 8'd1;
mem[4086] <= 8'd3;
mem[4087] <= 8'd1;
mem[4050] <= 8'd19;
mem[4051] <= 8'd0;
mem[4222] <= 8'd19;
mem[4223] <= 8'd0;
mem[4238] <= 8'd2;
mem[4239] <= 8'd1;
mem[5442] <= 8'd2;
mem[5443] <= 8'd1;
mem[5496] <= 8'd143;
mem[5497] <= 8'd0;
mem[8936] <= 8'd143;
mem[8937] <= 8'd0;
mem[9004] <= 8'd54;
mem[9005] <= 8'd0;
mem[11412] <= 8'd54;
mem[11413] <= 8'd0;
mem[9002] <= 8'd59;
mem[9003] <= 8'd0;
mem[11238] <= 8'd59;
mem[11239] <= 8'd0;
mem[10742] <= 8'd182;
mem[10743] <= 8'd0;
mem[11258] <= 8'd182;
mem[11259] <= 8'd0;
mem[11266] <= 8'd78;
mem[11267] <= 8'd0;
mem[11438] <= 8'd78;
mem[11439] <= 8'd0;
mem[11458] <= 8'd170;
mem[11459] <= 8'd0;
mem[13006] <= 8'd170;
mem[13007] <= 8'd0;
mem[9842] <= 8'd7;
mem[9843] <= 8'd0;
mem[8638] <= 8'd7;
mem[8639] <= 8'd0;
mem[8614] <= 8'd16;
mem[8615] <= 8'd0;
mem[7754] <= 8'd16;
mem[7755] <= 8'd0;
mem[7828] <= 8'd22;
mem[7829] <= 8'd0;
mem[15052] <= 8'd22;
mem[15053] <= 8'd0;
mem[15036] <= 8'd13;
mem[15037] <= 8'd0;
mem[6436] <= 8'd13;
mem[6437] <= 8'd0;
mem[6324] <= 8'd61;
mem[6325] <= 8'd0;
mem[5292] <= 8'd61;
mem[5293] <= 8'd0;
mem[5268] <= 8'd93;
mem[5269] <= 8'd0;
mem[4236] <= 8'd93;
mem[4237] <= 8'd0;
mem[4208] <= 8'd78;
mem[4209] <= 8'd0;
mem[2832] <= 8'd78;
mem[2833] <= 8'd0;
mem[2806] <= 8'd247;
mem[2807] <= 8'd1;
mem[1946] <= 8'd247;
mem[1947] <= 8'd1;
mem[1928] <= 8'd33;
mem[1929] <= 8'd1;
mem[1240] <= 8'd33;
mem[1241] <= 8'd1;
mem[1234] <= 8'd117;
mem[1235] <= 8'd0;
mem[1406] <= 8'd117;
mem[1407] <= 8'd0;
mem[1410] <= 8'd165;
mem[1411] <= 8'd1;
mem[1582] <= 8'd165;
mem[1583] <= 8'd1;
mem[15038] <= 8'd26;
mem[15039] <= 8'd0;
mem[6610] <= 8'd26;
mem[6611] <= 8'd0;
mem[6498] <= 8'd50;
mem[6499] <= 8'd0;
mem[5294] <= 8'd50;
mem[5295] <= 8'd0;
mem[6150] <= 8'd55;
mem[6151] <= 8'd0;
mem[5290] <= 8'd55;
mem[5291] <= 8'd0;
mem[5266] <= 8'd106;
mem[5267] <= 8'd0;
mem[4062] <= 8'd106;
mem[4063] <= 8'd0;
mem[4034] <= 8'd74;
mem[4035] <= 8'd0;
mem[2830] <= 8'd74;
mem[2831] <= 8'd0;
mem[1224] <= 8'd149;
mem[1225] <= 8'd1;
mem[536] <= 8'd149;
mem[537] <= 8'd1;
mem[1416] <= 8'd204;
mem[1417] <= 8'd0;
mem[2104] <= 8'd204;
mem[2105] <= 8'd0;
mem[2814] <= 8'd50;
mem[2815] <= 8'd1;
mem[2642] <= 8'd50;
mem[2643] <= 8'd1;
mem[2812] <= 8'd88;
mem[2813] <= 8'd1;
mem[2468] <= 8'd88;
mem[2469] <= 8'd1;
mem[2456] <= 8'd103;
mem[2457] <= 8'd1;
mem[1768] <= 8'd103;
mem[1769] <= 8'd1;
mem[1752] <= 8'd44;
mem[1753] <= 8'd0;
mem[1064] <= 8'd44;
mem[1065] <= 8'd0;
mem[1054] <= 8'd41;
mem[1055] <= 8'd1;
mem[882] <= 8'd41;
mem[883] <= 8'd1;
mem[1052] <= 8'd73;
mem[1053] <= 8'd0;
mem[708] <= 8'd73;
mem[709] <= 8'd0;
mem[700] <= 8'd138;
mem[701] <= 8'd0;
mem[356] <= 8'd138;
mem[357] <= 8'd0;
mem[348] <= 8'd124;
mem[349] <= 8'd1;
mem[4] <= 8'd124;
mem[5] <= 8'd1;
mem[350] <= 8'd41;
mem[351] <= 8'd2;
mem[178] <= 8'd41;
mem[179] <= 8'd2;
mem[718] <= 8'd76;
mem[719] <= 8'd3;
mem[1922] <= 8'd76;
mem[1923] <= 8'd3;
mem[1954] <= 8'd246;
mem[1955] <= 8'd1;
mem[3502] <= 8'd246;
mem[3503] <= 8'd1;
mem[15026] <= 8'd207;
mem[15027] <= 8'd0;
mem[5566] <= 8'd207;
mem[5567] <= 8'd0;
mem[5444] <= 8'd106;
mem[5445] <= 8'd0;
mem[4412] <= 8'd106;
mem[4413] <= 8'd0;
mem[4390] <= 8'd163;
mem[4391] <= 8'd2;
mem[3530] <= 8'd163;
mem[3531] <= 8'd2;
mem[3522] <= 8'd165;
mem[3523] <= 8'd0;
mem[3694] <= 8'd165;
mem[3695] <= 8'd0;
mem[3698] <= 8'd173;
mem[3699] <= 8'd3;
mem[3870] <= 8'd173;
mem[3871] <= 8'd3;
mem[3688] <= 8'd101;
mem[3689] <= 8'd0;
mem[3000] <= 8'd101;
mem[3001] <= 8'd0;
mem[2984] <= 8'd199;
mem[2985] <= 8'd1;
mem[2296] <= 8'd199;
mem[2297] <= 8'd1;
mem[2994] <= 8'd95;
mem[2995] <= 8'd0;
mem[3166] <= 8'd95;
mem[3167] <= 8'd0;
mem[10714] <= 8'd48;
mem[10715] <= 8'd0;
mem[8822] <= 8'd48;
mem[8823] <= 8'd0;
mem[8802] <= 8'd158;
mem[8803] <= 8'd0;
mem[8974] <= 8'd158;
mem[8975] <= 8'd0;
mem[9006] <= 8'd186;
mem[9007] <= 8'd0;
mem[11586] <= 8'd186;
mem[11587] <= 8'd0;
mem[11598] <= 8'd161;
mem[11599] <= 8'd0;
mem[10050] <= 8'd161;
mem[10051] <= 8'd0;
mem[10068] <= 8'd216;
mem[10069] <= 8'd0;
mem[13164] <= 8'd216;
mem[13165] <= 8'd0;
mem[13210] <= 8'd148;
mem[13211] <= 8'd1;
mem[14070] <= 8'd148;
mem[14071] <= 8'd1;
mem[14082] <= 8'd32;
mem[14083] <= 8'd0;
mem[14254] <= 8'd32;
mem[14255] <= 8'd0;
mem[10022] <= 8'd131;
mem[10023] <= 8'd0;
mem[9162] <= 8'd131;
mem[9163] <= 8'd0;
mem[9142] <= 8'd49;
mem[9143] <= 8'd1;
mem[8282] <= 8'd49;
mem[8283] <= 8'd1;
mem[8338] <= 8'd62;
mem[8339] <= 8'd1;
mem[14014] <= 8'd62;
mem[14015] <= 8'd1;
mem[9154] <= 8'd108;
mem[9155] <= 8'd0;
mem[9326] <= 8'd108;
mem[9327] <= 8'd0;
mem[9098] <= 8'd73;
mem[9099] <= 8'd1;
mem[4454] <= 8'd73;
mem[4455] <= 8'd1;
mem[8268] <= 8'd174;
mem[8269] <= 8'd0;
mem[7924] <= 8'd174;
mem[7925] <= 8'd0;
mem[11632] <= 8'd38;
mem[11633] <= 8'd0;
mem[13008] <= 8'd38;
mem[13009] <= 8'd0;
mem[13034] <= 8'd191;
mem[13035] <= 8'd0;
mem[13894] <= 8'd191;
mem[13895] <= 8'd0;
mem[13916] <= 8'd202;
mem[13917] <= 8'd2;
mem[14948] <= 8'd202;
mem[14949] <= 8'd2;
mem[13040] <= 8'd57;
mem[13041] <= 8'd1;
mem[14416] <= 8'd57;
mem[14417] <= 8'd1;
mem[14438] <= 8'd113;
mem[14439] <= 8'd3;
mem[14954] <= 8'd113;
mem[14955] <= 8'd3;
mem[14434] <= 8'd66;
mem[14435] <= 8'd1;
mem[14606] <= 8'd66;
mem[14607] <= 8'd1;
mem[13896] <= 8'd138;
mem[13897] <= 8'd0;
mem[13208] <= 8'd138;
mem[13209] <= 8'd0;
mem[0] <= 8'd0;
mem[1] <= 8'd0;
mem[176] <= 8'd0;
mem[177] <= 8'd0;
mem[352] <= 8'd0;
mem[353] <= 8'd0;
mem[528] <= 8'd0;
mem[529] <= 8'd0;
mem[704] <= 8'd0;
mem[705] <= 8'd0;
mem[880] <= 8'd0;
mem[881] <= 8'd0;
mem[1056] <= 8'd0;
mem[1057] <= 8'd0;
mem[1232] <= 8'd0;
mem[1233] <= 8'd0;
mem[1408] <= 8'd0;
mem[1409] <= 8'd0;
mem[1584] <= 8'd0;
mem[1585] <= 8'd0;
mem[1760] <= 8'd0;
mem[1761] <= 8'd0;
mem[1936] <= 8'd0;
mem[1937] <= 8'd0;
mem[2112] <= 8'd0;
mem[2113] <= 8'd0;
mem[2288] <= 8'd0;
mem[2289] <= 8'd0;
mem[2464] <= 8'd0;
mem[2465] <= 8'd0;
mem[2640] <= 8'd0;
mem[2641] <= 8'd0;
mem[2816] <= 8'd0;
mem[2817] <= 8'd0;
mem[2992] <= 8'd0;
mem[2993] <= 8'd0;
mem[3168] <= 8'd0;
mem[3169] <= 8'd0;
mem[3344] <= 8'd0;
mem[3345] <= 8'd0;
mem[3520] <= 8'd0;
mem[3521] <= 8'd0;
mem[3696] <= 8'd0;
mem[3697] <= 8'd0;
mem[3872] <= 8'd0;
mem[3873] <= 8'd0;
mem[4048] <= 8'd0;
mem[4049] <= 8'd0;
mem[4224] <= 8'd0;
mem[4225] <= 8'd0;
mem[4400] <= 8'd0;
mem[4401] <= 8'd0;
mem[4576] <= 8'd0;
mem[4577] <= 8'd0;
mem[4752] <= 8'd0;
mem[4753] <= 8'd0;
mem[4928] <= 8'd0;
mem[4929] <= 8'd0;
mem[5104] <= 8'd0;
mem[5105] <= 8'd0;
mem[5280] <= 8'd0;
mem[5281] <= 8'd0;
mem[5456] <= 8'd0;
mem[5457] <= 8'd0;
mem[5632] <= 8'd0;
mem[5633] <= 8'd0;
mem[5808] <= 8'd0;
mem[5809] <= 8'd0;
mem[5984] <= 8'd0;
mem[5985] <= 8'd0;
mem[6160] <= 8'd0;
mem[6161] <= 8'd0;
mem[6336] <= 8'd0;
mem[6337] <= 8'd0;
mem[6512] <= 8'd0;
mem[6513] <= 8'd0;
mem[6688] <= 8'd0;
mem[6689] <= 8'd0;
mem[6864] <= 8'd0;
mem[6865] <= 8'd0;
mem[7040] <= 8'd0;
mem[7041] <= 8'd0;
mem[7216] <= 8'd0;
mem[7217] <= 8'd0;
mem[7392] <= 8'd0;
mem[7393] <= 8'd0;
mem[7568] <= 8'd0;
mem[7569] <= 8'd0;
mem[7744] <= 8'd0;
mem[7745] <= 8'd0;
mem[7920] <= 8'd0;
mem[7921] <= 8'd0;
mem[8096] <= 8'd0;
mem[8097] <= 8'd0;
mem[8272] <= 8'd0;
mem[8273] <= 8'd0;
mem[8448] <= 8'd0;
mem[8449] <= 8'd0;
mem[8624] <= 8'd0;
mem[8625] <= 8'd0;
mem[8800] <= 8'd0;
mem[8801] <= 8'd0;
mem[8976] <= 8'd0;
mem[8977] <= 8'd0;
mem[9152] <= 8'd0;
mem[9153] <= 8'd0;
mem[9328] <= 8'd0;
mem[9329] <= 8'd0;
mem[9504] <= 8'd0;
mem[9505] <= 8'd0;
mem[9680] <= 8'd0;
mem[9681] <= 8'd0;
mem[9856] <= 8'd0;
mem[9857] <= 8'd0;
mem[10032] <= 8'd0;
mem[10033] <= 8'd0;
mem[10208] <= 8'd0;
mem[10209] <= 8'd0;
mem[10384] <= 8'd0;
mem[10385] <= 8'd0;
mem[10560] <= 8'd0;
mem[10561] <= 8'd0;
mem[10736] <= 8'd0;
mem[10737] <= 8'd0;
mem[10912] <= 8'd0;
mem[10913] <= 8'd0;
mem[11088] <= 8'd0;
mem[11089] <= 8'd0;
mem[11264] <= 8'd0;
mem[11265] <= 8'd0;
mem[11440] <= 8'd0;
mem[11441] <= 8'd0;
mem[11616] <= 8'd0;
mem[11617] <= 8'd0;
mem[11792] <= 8'd0;
mem[11793] <= 8'd0;
mem[11968] <= 8'd0;
mem[11969] <= 8'd0;
mem[12144] <= 8'd0;
mem[12145] <= 8'd0;
mem[12320] <= 8'd0;
mem[12321] <= 8'd0;
mem[12496] <= 8'd0;
mem[12497] <= 8'd0;
mem[12672] <= 8'd0;
mem[12673] <= 8'd0;
mem[12848] <= 8'd0;
mem[12849] <= 8'd0;
mem[13024] <= 8'd0;
mem[13025] <= 8'd0;
mem[13200] <= 8'd0;
mem[13201] <= 8'd0;
mem[13376] <= 8'd0;
mem[13377] <= 8'd0;
mem[13552] <= 8'd0;
mem[13553] <= 8'd0;
mem[13728] <= 8'd0;
mem[13729] <= 8'd0;
mem[13904] <= 8'd0;
mem[13905] <= 8'd0;
mem[14080] <= 8'd0;
mem[14081] <= 8'd0;
mem[14256] <= 8'd0;
mem[14257] <= 8'd0;
mem[14432] <= 8'd0;
mem[14433] <= 8'd0;
mem[14608] <= 8'd0;
mem[14609] <= 8'd0;
mem[14784] <= 8'd0;
mem[14785] <= 8'd0;
mem[14960] <= 8'd0;
mem[14961] <= 8'd0;
mem[15136] <= 8'd0;
mem[15137] <= 8'd0;

        end else begin
            if(we) begin
                mem[addr]<=data_in[7:0];
                mem[addr+1]<=data_in[15:8];
            end
        end
    end

    assign data_out = {mem[addr+1],mem[addr]};

endmodule

