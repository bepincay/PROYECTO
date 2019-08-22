LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comp_max is
	generic(n:integer:=6);
	port(A,B: in std_logic_vector(n downto 0);
		  OK_max: out std_logic);
end comp_max;

architecture sol of comp_max is
begin
	OK_max <= '1' when (A > B) else '0'; -- A a la ram y B debe conectarse al registro de maximo 
end sol;

