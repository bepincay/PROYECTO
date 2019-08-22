library ieee;
use ieee.std_logic_1164.all;

Entity mux4a1 is
generic(n:integer:=6);
PORT(	A, B, C, D: IN std_logic_vector(n downto 0);
		S: IN std_logic_vector(1 downto 0);
		Q: OUT std_logic_vector(n downto 0));
end mux4a1;

Architecture sol of mux4a1 is
Begin
	with S select
	Q <=	A when "00",
			B when "01",
			C when "10",
			D when "11";
end sol;