----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:56 05/02/2019 
-- Design Name: 
-- Module Name:    vsync - Behavioral 
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

entity vsync is
    Port ( button : in  STD_LOGIC;
           slow_clk : in  STD_LOGIC;
			  disp : out STD_LOGIC;
			  v_count: out integer;
           vs : out  STD_LOGIC);
end vsync;

architecture Behavioral of vsync is
signal count: integer range 0 to 416799;
begin

process(slow_clk,button)
begin
if (button='0') then
	if (slow_clk'event and slow_clk='1') then
		if(count=416799) then
			count <= 0;
		   vs <= '1';
			disp <= '0';
		elsif(count<1600) then
			count <= count+1;
			vs <= '0';
			disp <= '0';
		elsif(count>24799 and count<408800) then
			count <= count+1;
			vs <= '1';
			disp <= '1';
		else
			count <= count+1;
			vs <= '1';
			disp <= '0';
		end if;
	end if;
else
	count <=0;
	vs <= '0';
	disp <= '0';
end if;
end process;
v_count<=count;

end Behavioral;