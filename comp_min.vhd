LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comp_min is
	generic(n:integer:=6);
	port(A,B: in std_logic_vector(n downto 0);
		  OK_min: out std_logic);
end comp_min;

architecture sol of comp_min is
begin
	OK_min <= '1' when (A < B) else '0'; -- A a la ram y B debe conectarse al registro de minimo
end sol;

