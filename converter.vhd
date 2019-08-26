----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:25 04/09/2019 
-- Design Name: 
-- Module Name:    converter - flow 
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

entity converter is 
Port( 
		convin : in std_logic_vector(3 downto 0);
	   convout : out std_logic_vector(3 downto 0)
);
end converter;

architecture flow of converter is

begin
convout(3) <= convin(3) OR (convin(2) AND convin(1)) OR (convin(2) AND convin(0));
convout(2) <= (convin(3) AND convin(0)) OR (convin(2) AND (NOT convin(0)) AND (NOT convin(1)));
convout(1) <= (convin(1) AND convin(0)) OR (convin(1) AND (NOT convin(2))) OR (convin(3) AND (NOT convin(0)));
convout(0) <= (convin(3) AND (NOT convin(0))) OR (convin(0) AND (NOT convin(2)) AND (NOT convin(3))) OR (convin(2) AND (NOT convin(0)) AND convin(1));

end flow;
