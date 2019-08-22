library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mss is 
	port( 
		start, resetn, veinticuatro, tecla, ok, seg_3, off_3_seg, sobretemperatura, valido, seg_5, 
		off_5_seg, ok_mayor, ok_menor, una_hora, off_1_hora, clock_1khz, fin_veinticuatro, igual_add, 
		promedio, mayor, menor, regresar, reg_igual_veinticuatro, btn, solicitar:  in std_logic;	
		
		reset, en_reg_d, en_reg_u, en_disp, en_cnt_seg, rst_cnt_seg, sobretemp, modo, en_mayor, en_menor, 
		en_cnt_add_fijo, rst_add_fijo,sel_add, rst_hold_add, en_hold_add, en_promedio, reset_prom, s_div, end_add_din, 
		rst_add_din, prom_led, MY_led, MN_led, en_reg_add : out std_logic;

		selec_disp: out std_logic_vector (1 downto 0);

		estados: out std_logic_vector(5 downto 0));
end mss;
	
architecture solucion of mss is
type estado is (T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17,T18,T19,T20,T21,T22,T23,T24,T25,T26,
T27,T28,T29,T30,T31,T32,T33,T34,T35,T36,T37,T38);
signal y: estado;
begin
   process(clock_1khz,resetn)
	begin
	    if resetn='0' then y<=T1;
		 elsif (clock_1khz'event and clock_1khz='1') then 
		    case y is 
				when T1 =>  if start='1' then y <= T2; 
								else y <= T1; 
								end if;
								
				when T2 =>  if start='1' then y <= T2; 
								else y <= T3; 
								end if;
								
				when T3 =>  if tecla = '1' then Y<=T4;
								ELSIF SOLICITAR='1' then y<=T20;
								else y<=T3;--promedios, mayor y menor.
								end if;	
				
				When T4 => 	if tecla = '1' then y <= T4; 
								else y <= T5; 
								end if;
								
				when T5 => 	if tecla = '0' then y <= T5; 
								else y <= T6; 
								end if;	
								
				when T6 => 	if tecla = '1' then y <= T6; 
								else y<= T7; 
								end if; 
								
				when T7 => 	if ok = '0' then y <= T7; 
								else y <= T8; 
								end if;

				when T8 => 	if ok = '1' then y <= T8; 
								else y <= T9; 
								end if; 

				when T9 => 	if seg_3 = '0' then y <= T9; 
								else y <= T10; 
								end if; 
					
				when T10 => if off_3_seg ='1' then y<= T10;
								else y<= T11;
								end if; 

				when T11 => if sobretemperatura = '1'then y <= T12;
								elsif sobretemperatura = '0' then 
									if valido = '0' then y <= T3;
									elsif valido = '1' then y <= T13;
									end if; 
								end if;		
		
				when T12 => if seg_5 = '0' then y <= T12;
								else y<= T13;
								end if;			
			
				when T13 => if off_5_seg ='0' then 
									if valido = '1' then y <= T14; 
									else y <= T3;
									end if;  
								end if; 
				
				when T14 => Y<= T38;
				
				
									
				
				when T15 =>  y <= T16; 
								
				when T16 => If una_hora='0' then y <= T16;
								else y <= T17; 
								end if;
								
								--y<= T17;

				when T17 => if off_1_hora='0' then y <= T13;
								else y <= T17; 
								end if;
								
								--y<= T3;				
								
				when T18 => IF OK_MENOR='1' THEN y <= T19;
								ELSE Y<= T15;--en_mayor<='1';
								END IF;
				
				when T19 => y <= T15; --en_menor<='1';
				
				when T20 => if reg_igual_veinticuatro='0' then y <= T21;
								else y <= T24; 
								end if;
								
				when T21 => y <= T22;
				
				when T22 => if igual_add='0' then y <= T22;
								else y <= T23; 
								end if;
								
				when T23 => if promedio = '1'then y <= T26; --ve
								elsif mayor = '1' then y <= T31;
								elsif menor = '1' then y <= T34;
								else y <= T23;
								end if;
				
				when T24 => y <= T25;
				
				when T25 => if fin_veinticuatro='0' then y <= T25;
								else y <= T23; 
								end if;
				
				when T26 => if promedio = '1' then y <= T26;
								else y <= T27; 
								end if;
								
				when T27 => if btn = '1'  then y <= T29;
									elsif btn = '0' then 
									if seg_5 = '0' then y <= T27;
									elsif seg_5 = '1' then y <= T28; 
									end if;
								end if;	
				
				when T28 => if off_5_seg ='1' then y <= T28;
								else y <= T29; 
								end if;
				
				when T29 => if regresar='0' then  y <= T29;
								else y <= T30; 
								end if;
				
				when T30 => if regresar='1' then y <= T30;--regresa al estado 3 
								else y <= T3; 
								end if;
				
				when T31 => if mayor = '1' then y <= T31;
								else y <= T32; 
								end if;
				
				when T32 => if btn = '1'  then y <= T29;
									elsif btn = '0' then 
									if seg_5 = '0' then y <= T32;
									elsif seg_5 = '1' then y <= T33; 
									end if;
								end if;
				
				when T33 => if off_5_seg ='1' then y <= T33; 
								else y <= T29; 
								end if;
				 
				when T34 => if menor = '1' then y <= T34;
								else y <= T35; 
								end if;
				
				when T35 => if btn = '1'  then y <= T29;
									elsif btn = '0' then 
									if seg_5 = '0' then y <= T35;
									elsif seg_5 = '1' then y <= T36; 
									end if;
								end if;
				
				when T36 => if off_5_seg ='1' then y <= T36; 
								else y <= T29; 
								end if;	
								
				WHEN T37 => if OK_MENOR='1' then y <= T19;
								else y <= T15; 
								end if;
								
				WHEN T38 => if ok_mayor='1' then y<= T18; 
								else y<= T37; 
								end if; 
			 end case;
	    end if;
	end process;
	
	
	process(y,tecla, veinticuatro, ok_mayor, ok_menor)
	 
	begin
		selec_disp <= "00"; reset <= '0'; en_reg_d <= '0'; en_reg_u <= '0'; en_disp <= '0'; en_cnt_seg <= '0';
		rst_cnt_seg <= '0'; sobretemp <= '0'; modo <= '0'; en_mayor <= '0'; en_menor <= '0'; en_cnt_add_fijo <= '0'; 
		rst_add_fijo <= '0'; sel_add <= '0'; en_hold_add<='0'; end_add_din<='0';
		rst_add_din<= '0'; prom_led<='0'; MY_led<='0'; MN_led<='0';
		rst_hold_add<='0'; en_promedio<='0'; s_div <='0'; en_reg_add <='0'; reset_prom <='0'; estados <= "000000";
		case y is
			when T1 =>  reset <= '1'; estados <= "000001";--1
			
			when T2 =>  estados <= "000010";--2
			
			when T3 =>  if tecla='1' then en_reg_d <= '1'; end if; estados <= "000011"; --3    
			
			when T4 =>  estados <= "000100";--4
			
			when T5 =>  if tecla='1' then  en_reg_u <= '1'; end if; estados <= "000101";--5
			
			when T6 =>  estados <= "000110";--6 
			
			when T7 =>  estados <= "000111";--7
			
			when T8 =>  estados <= "001000"; --8
			
			when T9 =>  en_disp <= '1'; en_cnt_seg <= '1';estados <= "001001";--9 
			
			when T10 => rst_cnt_seg <= '1'; estados <= "001010";--10
			
			when T11 => estados <= "001011";--11
			
			when T12 => en_cnt_seg <= '1'; sobretemp <= '1';estados <= "001100"; --12
			
			when T13 => rst_cnt_seg <= '1'; estados <= "001101";--13 
			
			when T14 => estados <= "001110"; modo <= '1'; rst_cnt_seg<='1'; --14
			
			when T15 => en_cnt_add_fijo <= '1';estados <= "001111"; --15
			
			when T16 => en_cnt_seg <= '1';estados <= "010000";--16
			
			when T17 => rst_cnt_seg <= '1'; estados <= "010001";--17
			
			when T18 => en_mayor<='1'; estados <= "010010";--18
			
			when T19 => en_menor<='1'; estados <= "010011";--19
			
			when T20 => en_reg_add<='1'; estados <= "010100";--20
			
			when T21 => en_hold_add<='1'; rst_add_din<= '1';reset_prom <='1'; estados <= "010101";--21
			
			when T22 => end_add_din<='1'; en_promedio<= '1';sel_add <= '1';  estados <= "010110";--22
			
			when T23 => estados <= "010111";--23
			
			when T24 => reset_prom <='1'; rst_add_din<= '1'; estados <= "011000";--24
			
			when T25 => s_div <='1'; end_add_din<='1'; en_promedio<= '1'; estados <= "011001";--25
			
			when T26 => estados <= "011010";--26
			
			when T27 => en_disp <= '1'; selec_disp <= "01"; en_cnt_seg <= '1';prom_led<='1'; estados <= "011011";--27
			
			when T28 => rst_cnt_seg <= '1'; estados <= "011100";--28
			
			when T29 => estados <= "011101";--29
			
			when T30 => estados <= "011110";--30
			
			when T31 => estados <= "011111";--31
			
			when T32 => en_disp <= '1'; selec_disp <= "10"; en_cnt_seg <= '1'; MY_led<='1'; estados <= "100000";--32
			
			when T33 => rst_cnt_seg <= '1'; estados <= "100001";--33
			
			when T34 => estados <= "100010";--34
			
			when T35 => en_disp <= '1'; selec_disp <= "11"; en_cnt_seg <= '1'; MN_led<='1'; estados <= "100011";--35
			
			when T36 => rst_cnt_seg <= '1'; estados <= "100100";--36
			
			WHEN T37 =>  
			
			WHEN T38 =>  
			
		end case;
	end process;
end solucion;
	
 
 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
