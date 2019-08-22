library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comp_rango is
	port
	(
		A: in std_logic_vector(6 downto 0);
		valido, sobretemp : out std_logic
	);
end comp_rango;

architecture sol of comp_rango is
	begin
		process(A) begin
			sobretemp <= '0';
			valido <= '0';
			if (A > "10111") then
				sobretemp <= '1';
			end if;
			if (A >= "10001" AND A <= "11010") then
				valido <= '1';
			end if;
		end process;
end sol;