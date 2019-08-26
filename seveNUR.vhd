----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:06:03 04/09/2019 
-- Design Name: 
-- Module Name:    seveNuri - Behavioral 
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

entity seveNUR is
Port ( lowdigit: in std_logic_vector (3 downto 0);
		 highdigit: in std_logic_vector (3 downto 0);
		 signbit: in std_logic;
		 neg_sig: out std_logic_vector (7 downto 0);
		 low_dig: out std_logic_vector (7 downto 0);
		 high_dig: out std_logic_vector (7 downto 0)
);

end seveNUR; --CEYDA<33333

architecture Behavioral of seveNUR is

begin
with lowdigit select   
low_dig <="11000000" when "0000",  
"11111001" when "0001",  
"10100100" when "0010",
"10110000" when "0011",
"10011001" when "0100",   
"10010010" when "0101", 
"10000010" when "0110", 
"11111000" when "0111", 
"10000000" when "1000", 
"10010000" when "1001", 
"11111111" when others; 

with highdigit select  
high_dig <="11000000" when "0000",  
"11111001" when "0001",  
"10100100" when "0010",
"10110000" when "0011",
"10011001" when "0100",   
"10010010" when "0101", 
"10000010" when "0110", 
"11111000" when "0111", 
"10000000" when "1000", 
"10010000" when "1001", 
"11111111" when others; 

with signbit select 
neg_sig <= "11111111" when '0',
"10111111" when others;
end Behavioral;

