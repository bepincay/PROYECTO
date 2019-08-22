LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador_seg IS
	generic(n :integer:=2);
	PORT(clock,enable,reset: IN STD_LOGIC;
		 --tres_seg, cinco_seg: OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (n downto 0));
END contador_seg;

ARCHITECTURE sol OF contador_seg IS
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='1' then Q<="000";--tres_seg<='0'; cinco_seg<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				
			--	if (Q="011") then tres_seg<='1';
			--	end if;
				if (Q="111") then Q<="000";--cinco_seg<='1';
				else Q<=Q+1;--cinco_seg<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END sol;