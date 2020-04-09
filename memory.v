module memory (
    input wire clk,
    input wire rst_n,
    input wire [15:0] addr,
    input wire [15:0] data_in,
    input wire we,
    output wire [15:0] data_out
);
    wire [11:0] addr_l;
    assign addr_l=addr[9:0];
    reg [7:0] mem [1023:0]; //0x3ff

    integer i;

    always @(posedge clk) begin
        if(!rst_n) begin
            //for(i=0;i<1024;i=i+1)
            //    mem[i]<=8'h0;

            for(i=0;i<882;i=i+2)
                mem[i]<=8'hff;
            for(i=1;i<882;i=i+2)
                mem[i]<=8'hf;

mem[2] <= 8'd15;                                                         
mem[3] <= 8'd0;
mem[42] <= 8'd15;
mem[43] <= 8'd0;
mem[48] <= 8'd9;
mem[49] <= 8'd0;
mem[128] <= 8'd9;
mem[129] <= 8'd0;
mem[142] <= 8'd30;

mem[143] <= 8'd0;
mem[342] <= 8'd30;
mem[343] <= 8'd0;
mem[354] <= 8'd21;
mem[355] <= 8'd0;
mem[394] <= 8'd21;
mem[395] <= 8'd0;
mem[398] <= 8'd34;
mem[399] <= 8'd0;
mem[438] <= 8'd34;
mem[439] <= 8'd0;
mem[4] <= 8'd14;
mem[5] <= 8'd0;
mem[84] <= 8'd14;
mem[85] <= 8'd0;
mem[92] <= 8'd10;
mem[93] <= 8'd0;
mem[172] <= 8'd10;
mem[173] <= 8'd0;
mem[184] <= 8'd27;
mem[185] <= 8'd0;
mem[344] <= 8'd27;
mem[345] <= 8'd0;
mem[358] <= 8'd25;
mem[359] <= 8'd0;
mem[478] <= 8'd25;
mem[479] <= 8'd0;
mem[46] <= 8'd7;
mem[47] <= 8'd0;
mem[86] <= 8'd7;
mem[87] <= 8'd0;
mem[94] <= 8'd18;
mem[95] <= 8'd0;
mem[214] <= 8'd18;
mem[215] <= 8'd0;
mem[228] <= 8'd31;
mem[229] <= 8'd0;
mem[388] <= 8'd31;
mem[389] <= 8'd0;
mem[402] <= 8'd31;
mem[403] <= 8'd0;
mem[522] <= 8'd31;
mem[523] <= 8'd0;
mem[174] <= 8'd4;
mem[175] <= 8'd0;
mem[134] <= 8'd4;
mem[135] <= 8'd0;
mem[140] <= 8'd48;
mem[141] <= 8'd0;
mem[300] <= 8'd48;
mem[301] <= 8'd0;
mem[316] <= 8'd59;
mem[317] <= 8'd0;
mem[476] <= 8'd59;
mem[477] <= 8'd0;
mem[486] <= 8'd31;
mem[487] <= 8'd0;
mem[526] <= 8'd31;
mem[527] <= 8'd0;
mem[524] <= 8'd35;
mem[525] <= 8'd0;
mem[444] <= 8'd35;
mem[445] <= 8'd0;
mem[432] <= 8'd57;
mem[433] <= 8'd0;
mem[272] <= 8'd57;
mem[273] <= 8'd0;
mem[262] <= 8'd16;
mem[263] <= 8'd0;
mem[222] <= 8'd16;
mem[223] <= 8'd0;
mem[218] <= 8'd14;
mem[219] <= 8'd0;
mem[178] <= 8'd14;
mem[179] <= 8'd0;
mem[588] <= 8'd9;
mem[589] <= 8'd0;
mem[28] <= 8'd9;
mem[29] <= 8'd0;
mem[458] <= 8'd73;
mem[459] <= 8'd0;
mem[818] <= 8'd73;
mem[819] <= 8'd0;
mem[546] <= 8'd66;
mem[547] <= 8'd0;
mem[26] <= 8'd66;
mem[27] <= 8'd0;
mem[496] <= 8'd64;
mem[497] <= 8'd0;
mem[736] <= 8'd64;
mem[737] <= 8'd0;
mem[632] <= 8'd63;
mem[633] <= 8'd0;
mem[72] <= 8'd63;
mem[73] <= 8'd0;
mem[540] <= 8'd54;
mem[541] <= 8'd0;
mem[780] <= 8'd54;
mem[781] <= 8'd0;
mem[686] <= 8'd8;
mem[687] <= 8'd0;
mem[326] <= 8'd8;
mem[327] <= 8'd0;
mem[292] <= 8'd60;
mem[293] <= 8'd0;
mem[852] <= 8'd60;
mem[853] <= 8'd0;
mem[0] <= 8'd0;
mem[1] <= 8'd0;
mem[44] <= 8'd0;
mem[45] <= 8'd0;
mem[88] <= 8'd0;
mem[89] <= 8'd0;
mem[132] <= 8'd0;
mem[133] <= 8'd0;
mem[176] <= 8'd0;
mem[177] <= 8'd0;
mem[220] <= 8'd0;
mem[221] <= 8'd0;
mem[264] <= 8'd0;
mem[265] <= 8'd0;
mem[308] <= 8'd0;
mem[309] <= 8'd0;
mem[352] <= 8'd0;
mem[353] <= 8'd0;
mem[396] <= 8'd0;
mem[397] <= 8'd0;
mem[440] <= 8'd0;
mem[441] <= 8'd0;
mem[484] <= 8'd0;
mem[485] <= 8'd0;
mem[528] <= 8'd0;
mem[529] <= 8'd0;
mem[572] <= 8'd0;
mem[573] <= 8'd0;
mem[616] <= 8'd0;
mem[617] <= 8'd0;
mem[660] <= 8'd0;
mem[661] <= 8'd0;
mem[704] <= 8'd0;
mem[705] <= 8'd0;
mem[748] <= 8'd0;
mem[749] <= 8'd0;
mem[792] <= 8'd0;
mem[793] <= 8'd0;
mem[836] <= 8'd0;
mem[837] <= 8'd0;
mem[880] <= 8'd0;
mem[881] <= 8'd0;

        end else begin
            if(we) begin
                mem[addr_l]<=data_in[7:0];
                mem[addr_l+1]<=data_in[15:8];
            end
        end
    end

    assign data_out = {mem[addr_l+1],mem[addr_l]};

endmodule

