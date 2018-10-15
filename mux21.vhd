----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:00 09/05/2018 
-- Design Name: 
-- Module Name:    mux21 - Behavioral 
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

entity mux21 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);  -- PC
           B : in  STD_LOGIC_VECTOR (7 downto 0);	-- RDM
           sel : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end mux21;

architecture Behavioral of mux21 is

begin

	S <= B when (sel = '1') else A;


end Behavioral;

