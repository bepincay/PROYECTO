Library ieee;
use ieee.std_logic_1164.all;

entity teclado is 
port (clock: in std_logic;
		filas: in std_logic_vector(3 downto 0);
		columnas: out std_logic_vector(3 downto 0);
		numero: out std_logic_vector(3 downto 0);
		P: OUT STD_LOGIC);
		
end teclado;

architecture sol of teclado is
type estado is (s0, s1, s2, s3);
signal ysig, ypre: estado;

begin
	process(clock)
	begin 
		if (rising_edge(clock)) then ypre <= ysig;
		end if;
	end process;

	process(ypre, filas)
	begin
		case ypre is 
		
			when s0 => columnas <= "0111";
				if filas = "0111" then numero <= "0001"; ysig <= s0; P<='1';
				elsif filas = "1011" then numero <= "0100"; ysig <= s0; P<='1';
				elsif filas = "1101" then numero <= "0111"; ysig <= s0; P<='1';
				else numero <= "0000"; ysig <= s1; P<='0';
				end if;
	
			
			when s1 => columnas <= "1011";
				if filas = "0111" then numero <= "0010"; ysig <= s1;P<='1';
				elsif filas = "1011" then numero <= "0101"; ysig <= s1; P<='1';
				elsif filas = "1101" then numero <= "1000"; ysig <= s1; P<='1';
				elsif filas = "1110" then numero <= "0000"; ysig <= s1; P<='1';
				else numero <= "0000"; ysig <= s2; P<='0';
				end if;
			
			
				
			when s2 => columnas <= "1101";
				if filas = "0111" then numero <= "0011"; ysig <= s2; P<='1';
				elsif filas = "1011" then numero <= "0110"; ysig <= s2; P<='1';
				elsif filas = "1101" then numero <= "1001"; ysig <= s2; P<='1';
				else numero <= "0000"; ysig <= s3; P<='0';
				end if;
				
				
				
			when s3 => columnas <= "1110";
				if filas = "0111" then numero <= "0000"; ysig <= s3; P<='1'; 
				elsif filas = "1011" then numero <= "0000"; ysig <= s3; P<='1';
				elsif filas = "1101" then numero <= "0000"; ysig <= s3; P<='1';
				else numero <= "0000"; ysig <= s0; P<='0';
				end if;
				
			
		end case;
	end process;
end architecture;