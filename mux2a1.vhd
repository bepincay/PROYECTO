library ieee;
use ieee.std_logic_1164.all;

Entity mux2a1 is
generic(n:integer:=4);
PORT(	A, B: IN std_logic_vector(n downto 0);
		S: IN std_logic;
		Q: OUT std_logic_vector(n downto 0));
end mux2a1;

Architecture sol of mux2a1 is
Begin
	with S select
	Q <=	A when '0',
			B when '1';
end sol;