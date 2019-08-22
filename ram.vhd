library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Memoria ram de m palabras de n bits
entity ram is
	generic(n:integer:=6;
			  m:integer:=4);
	port(addr: in std_logic_vector(m downto 0);
		  we, clk: in std_logic;
		  data_i: in std_logic_vector(n downto 0);
		  data_o: out std_logic_vector(n downto 0)
	);
end ram;


architecture arch of ram is
	type ram_table is array (0 to 23) of std_logic_vector(n downto 0);
	signal rammemory: ram_table;
begin
	process(we,clk,addr)
	begin
		if clk'event and clk='1' then
			if we='1' then
				rammemory(conv_integer(addr))<=data_i;
			end if;
		end if;
		data_o <= rammemory(conv_integer(addr));
	end process;
end arch;