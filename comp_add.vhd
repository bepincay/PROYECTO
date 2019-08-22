LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comp_add is
	generic(n:integer:=4);
	port(A,B: in std_logic_vector(n downto 0);
		  A_igual_B: out std_logic);
end comp_add;

architecture sol of comp_add is
begin
	 A_igual_B <= '1' when (A = B) else '0'; -- A a la ram y B debe conectarse al registro de maximo 
end sol;

