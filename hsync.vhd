----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:13 05/02/2019 
-- Design Name: 
-- Module Name:    hsync - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hsync is
    Port ( button : in  STD_LOGIC;
           slow_clk : in  STD_LOGIC;
			  disp : out STD_LOGIC;
			  h_count: out integer;
           hs : out  STD_LOGIC);
end hsync;

architecture Behavioral of hsync is
signal count: integer range 0 to 799;
begin

process(slow_clk,button)
begin
if (button='0') then
	if (slow_clk'event and slow_clk='1') then
		if(count=799) then
			count <= 0;
			hs <= '1';
			disp <= '0';
		elsif(count<96) then
			count <= count+1;
			hs <= '0';
			disp <= '0';
		elsif(count>143 and count<784) then
			count <= count+1;
			hs <= '1';
			disp <= '1';
		else
			count <= count+1;
			hs <= '1';
			disp <= '0';
		end if;
	end if;
else
	count <=0;
	hs <= '0';
	disp <= '0';
end if;
end process;
h_count<=count;

end Behavioral;