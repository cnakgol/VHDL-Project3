----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:01 04/14/2019 
-- Design Name: 
-- Module Name:    frequencydivider - Behavioral 
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
use IEEE.std_logic_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freqdivider is
PORT(
	fast_clk: in std_logic;
	button: in std_logic;
	slow_clk: out std_logic
);
end freqdivider;

architecture Behavioral of freqdivider is

signal count: STD_LOGIC:= '0';
signal refr_clk: STD_LOGIC:='0';

begin

freq_div: process(fast_clk,button) 
begin
  if(button='0') then
	if (fast_clk='1' and fast_clk'event) then
		if(count='1') then
			count <= '0';
			refr_clk <= not refr_clk;
		else
			count <= not count ;
		end if;
	end if;
  else
   count <= '0';
	refr_clk <= '0';
  end if;
end process;

slow_clk <= refr_clk;

end Behavioral;