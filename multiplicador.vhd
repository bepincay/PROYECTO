
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY multiplicador IS
	generic(n :integer:=3;
			  m : integer:=6);
	PORT (a : IN std_logic_vector(n DOWNTO 0); 
			b : IN std_logic_vector(n DOWNTO 0); 
         salida : OUT std_logic_vector(m DOWNTO 0));
   END multiplicador;
 
ARCHITECTURE sol OF multiplicador IS
	BEGIN
	salida <= conv_std_logic_vector(conv_integer(a) * conv_integer(b),salida'length) when b>"0000"	else "0000000";
	
END sol;