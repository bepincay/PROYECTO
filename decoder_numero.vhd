library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity decoder_numero is
	Port (Ent: in STD_LOGIC_VECTOR(6 downto 0);
		enable: in STD_LOGIC;
		dispA : OUT STD_LOGIC_VECTOR(6 downto 0);
		dispB : OUT STD_LOGIC_VECTOR(6 downto 0));
end decoder_numero;

Architecture sol of decoder_numero is
signal mod1:STD_LOGIC_VECTOR(6 downto 0);
signal mod2:STD_LOGIC_VECTOR(3 downto 0);
signal numA:STD_LOGIC_VECTOR(3 downto 0);
signal numB:STD_LOGIC_VECTOR(3 downto 0);
Begin
	process(Ent,mod1,mod2,numB,numA)
	begin
		mod1<=conv_std_logic_vector(conv_integer(Ent) MOD 100,7);
		mod2<=conv_std_logic_vector(conv_integer(mod1) MOD 10,4);
		numA<=conv_std_logic_vector(conv_integer(mod1) / 10,4);
		numB<=mod2;
	end process;
			  --abcdefg
		dispA <=	"1111110"	when numA = "0000" and enable='1' ELSE --0
				"0110000"  	when numA = "0001" and enable='1' ELSE --1
				"1101101" 	when numA = "0010" and enable='1' ELSE --2
				"1111001"	when numA = "0011" and enable='1' ELSE --3
				"0110011"	when numA = "0100" and enable='1' ELSE --4
				"1011011"	when numA = "0101" and enable='1' ELSE --5
				"1011111"	when numA = "0110" and enable='1' ELSE --6
				"1110000"	when numA = "0111" and enable='1' ELSE --7
				"1111111"	when numA = "1000" and enable='1' ELSE --8
				"1111011"	when numA = "1001" and enable='1' ELSE --9
				"0000001"; 		
		dispB <=	"1111110"	when numB = "0000" and enable='1' ELSE --0
				"0110000"  	when numB = "0001" and enable='1' ELSE --1
				"1101101" 	when numB = "0010" and enable='1' ELSE --2
				"1111001"	when numB = "0011" and enable='1' ELSE --3
				"0110011"	when numB = "0100" and enable='1' ELSE --4
				"1011011"	when numB = "0101" and enable='1' ELSE --5
				"1011111"	when numB = "0110" and enable='1' ELSE --6
				"1110000"	when numB = "0111" and enable='1' ELSE --7
				"1111111"	when numB = "1000" and enable='1' ELSE --8
				"1111011"	when numB = "1001" and enable='1' ELSE --9
				"0000001";
end sol;