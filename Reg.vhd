----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:51:18 10/13/2018 
-- Design Name: 
-- Module Name:    Reg - Behavioral 
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

entity Reg is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
			  clk: in STD_LOGIC;
			  carga: in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end Reg;

architecture Behavioral of Reg is

begin

process(clk)
begin

	if ( RISING_EDGE(clk) AND carga = '1' )  then
		S <= A;
	end if;
	
end process;
		
end Behavioral;

