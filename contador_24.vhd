LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador_24 IS
	generic(n :integer:=4);
	PORT(clock,enable,reset: IN STD_LOGIC;
		 veinticuatro: OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (n downto 0));
END contador_24;

ARCHITECTURE sol OF contador_24 IS
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='1' then Q<="00000"; veinticuatro<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="11000") then veinticuatro<='1'; Q<="00000";
				else Q<=Q+1; veinticuatro<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END sol;