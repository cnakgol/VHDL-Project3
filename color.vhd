----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:30 05/02/2019 
-- Design Name: 
-- Module Name:    color - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies:   
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color is
    Port ( button : in  STD_LOGIC;
			  left: in STD_LOGIC;
			  right: in STD_LOGIC;
           slow_clk : in  STD_LOGIC;
			  enable : in STD_LOGIC;
			  h_count: in integer;
			  v_count: in integer;
			  sscore: out STD_LOGIC_VECTOR (5 downto 0);
			  red: out STD_LOGIC_VECTOR (2 downto 0);
			  green: out STD_LOGIC_VECTOR (2 downto 0);
			  blue: out STD_LOGIC_VECTOR (1 downto 0)
			  );
end color;

architecture Behavioral of color is

signal con,con1,con2,con3,con4,con5,con6,conl: STD_LOGIC_VECTOR (0 to 7):="00000000";
signal cr1,cr2,cr3,cr4,cr5,cr6: integer range 24800 to 408799;
signal cb: integer range 0 to 800;
signal cd: integer range 0 to 499;
signal cd2: integer range 0 to 99999;
signal crl: integer range 24800 to 47799;
signal gameover: STD_LOGIC;
signal score: STD_LOGIC_VECTOR (5 downto 0);

begin

process(slow_clk,button)
begin

if(button='1' or gameover='1') then
	crl<=24800;
	cb<=429;
	cr3<=80800;
	cr4<=248800;
	cr1<=24800;
	cr2<=192800;
	cr5<=136800;
	cr6<=248000;
	con <= "00000000";
	con1 <= "00000000";
	con2 <= "00000000";
	con3 <= "00000000";
	con4 <= "00000000";
	con5 <= "00000000";
	con6 <= "00000000";
	conl <= "00000000";
	cd <= 0;
	cd2 <= 0;
	gameover<='0';
	score<="000000";
elsif (slow_clk='1' and slow_clk'event) then
		if(crl=47799) then
			crl<=24800;
		else crl<=crl+1;
		end if;
		if(cd=499) then
			cd<=0;
			if(cr1>328800) then
				cr1<=24800;
				score<=score+"000001";
			else cr1<=cr1+1;
			end if;
			if(cr2>328800) then
				cr2<=24800;
				score<=score+"000001";
			else cr2<=cr2+1;
			end if;
			if(cr3>328800) then
				cr3<=24800;
				score<=score+"000001";
			else cr3<=cr3+1;
			end if;
			if(cr4>328800) then
				cr4<=24800;
				score<=score+"000001";
			else cr4<=cr4+1;
			end if;
			if(cr5>328800) then
				cr5<=24800;
				score<=score+"000001";
			else cr5<=cr5+1;
			end if;
			if(cr6>328800) then
				cr6<=24800;
				score<=score+"000001";
			else cr6<=cr6+1;
			end if;
			
		else cd<=cd+1;
		end if;
		
		if(cd2=99999) then
			cd2<=0;
			if(left='1') then
				cb<=cb-1;
			elsif(right='1') then
				cb<=cb+1;
			end if;
		else cd2<=cd2+1;
		end if;
		
		if(enable='1') then
		
		if((h_count>=243 and h_count<=245) or (h_count>=353 and h_count<=355) or
			(h_count>=463 and h_count<=465) or (h_count>=573 and h_count<=575) or
			(h_count>=683 and h_count<=685)) then
			
								if((v_count>=crl and v_count<crl+24000) or (v_count>=crl+192000 and v_count<crl+216000) or
									(v_count>=crl+48000 and v_count<crl+72000) or (v_count>=crl+240000 and v_count<crl+264000) or
									(v_count>=crl+96000 and v_count<crl+120000) or (v_count>=crl+288000 and v_count<crl+312000) or
									(v_count>=crl+144000 and v_count<crl+168000) or (v_count>=crl+336000 and v_count<crl+360000)) then
									conl<="11111111";
								else
									conl<="00000000";
								end if;
		else
			conl<="00000000";
		end if;
						
		--------------  Linie 1
						if(h_count>=154 and h_count<224) then
								if(v_count>=cr3 and v_count<cr3+72000) then
									con1<="11100000";
								else
									con1<="00000000";
								end if;
						else
							con1<="00000000";
						end if;
						
						if(h_count>=264 and h_count<334) then
								if(v_count>=cr4 and v_count<cr4+72000) then
									con2<="11100000";
								else
									con2<="00000000";
								end if;
						else
							con2<="00000000";
						end if;
						
		--------------  Linie 2				
						if(h_count>=374 and h_count<444) then
								if(v_count>=cr1 and v_count<cr1+72000) then
									con3<="11100000";
								else
									con3<="00000000";
								end if;
						else
							con3<="00000000";
						end if;
						
						if(h_count>=484 and h_count<554) then
								if(v_count>=cr2 and v_count<cr2+72000) then
									con4<="11100000";
								else
									con4<="00000000";
								end if;
						else
							con4<="00000000";
						end if;
		--------------  Linie 3	

						if(h_count>=594 and h_count<664) then
								if(v_count>=cr5 and v_count<cr5+72000) then
									con5<="11100000";
								else
									con5<="00000000";
								end if;
						else
							con5<="00000000";
						end if;
						
						if(h_count>=704 and h_count<774) then
								if(v_count>=cr6 and v_count<cr6+72000) then
									con6<="11100000";
								else
									con6<="00000000";
								end if;
						else
							con6<="00000000";
						end if;

				
				if(v_count>319999 and v_count<391999) then
						if(h_count>=cb and h_count<=cb+69) then
							con<="11111111";
						else
							con<="00000000";
						end if;
				else
					con<="00000000";
				end if;
	-------------------------------
			if(cr3>=240800) then
				if(cb>=84 and cb<224) then
					--gameover
						gameover<='1';
					end if;
			end if;
			--	
			if(cr4>=240800) then
				if(cb>=194 and cb<=334) then
					--gameover
						gameover<='1';
				end if;
			end if;
		---------	
		if(cr1>=240800) then
				if(cb>=304 and cb<444) then
					--gameover
						gameover<='1';
					end if;
			end if;
			--	
			if(cr2>=240800) then
				if(cb>=414 and cb<554) then
					--gameover
						gameover<='1';
				end if;
			end if;
		---------	
		if(cr5>=240800) then
				if(cb>=524 and cb<664) then
					--gameover
						gameover<='1';
					end if;
			end if;
			--	
			if(cr6>=240800) then
				if(cb>=634 and cb<774) then
					--gameover
						gameover<='1';
				end if;
			end if;
		---------------------------------------
			if(cb<144 or cb>704) then
					--gameover
					gameover<='1';
			end if;
	
		end if;

end if;
end process;

sscore<=score;
blue <= con(6 to 7) or con1(6 to 7) or con2(6 to 7) or con3(6 to 7) or con4(6 to 7) or con5(6 to 7) or con6(6 to 7) or conl(6 to 7);
green <= con(3 to 5) or con1(3 to 5) or con2(3 to 5) or con3(3 to 5) or con4(3 to 5) or con5(3 to 5) or con6(3 to 5) or conl(3 to 5);
red <= con(0 to 2) or con1(0 to 2) or con2(0 to 2) or con3(0 to 2) or con4(0 to 2) or con5(0 to 2) or con6(0 to 2) or conl(0 to 2);

end Behavioral;