LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY registro_sost_uni_dec IS
   generic(n : integer := 3);
	PORT(clock,reset,enable: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(n downto 0);
		 Q : OUT STD_LOGIC_VECTOR (n downto 0));
END registro_sost_uni_dec;

ARCHITECTURE sol OF registro_sost_uni_dec IS
SIGNAL temp: STD_LOGIC_VECTOR(n downto 0);
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='1' then temp<="0000";
		elsif (clock'event and clock='1') then
			if(enable='1') then 
				temp<=Ent;
			end if;
		end if;
	end process;
	Q<=temp;
END sol;
