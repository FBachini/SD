----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:16 10/14/2018 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
    Port ( OP : in  STD_LOGIC_VECTOR (15 downto 0);
           N : in  STD_LOGIC;
           Z : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  carga_REM : out STD_LOGIC := '0';
			  carga_RDM : out STD_LOGIC := '0';
			  carga_RI : out STD_LOGIC := '0';
			  sel_ULA : out STD_LOGIC_VECTOR (2 downto 0) := "000";
			  carga_AC : out STD_LOGIC := '0';
			  carga_NZ : out STD_LOGIC := '0';
			  carga_PC : out STD_LOGIC := '0';
			  Inc_PC: out STD_LOGIC := '0';
			  -- RAM_Read : out STD_LOGIC;
			  RAM_Write : out STD_LOGIC := '0';
           sel_mux : out  STD_LOGIC := '0');
end FSM;

architecture Behavioral of FSM is


type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13);
signal estado: state_type;
	
begin

process(OP, N, Z, clk, estado, rst)
begin

	if rst = '1' then
		estado <= S0;
	elsif RISING_EDGE(clk) then
		
		case estado is
	
		when S0 => estado <= S1;
		
		when S1 => estado <= S2;
					
		when S2 =>
			
			if ( OP(6) = '1' OR OP(13) = '1' ) then
				estado <= S3;																						-- NOT ou SHL
	
			elsif (OP(9)='1' AND N = '0') OR (OP(10)='1' AND Z = '0') OR OP(0)= '1' then		-- JZ e JN com flags N e Z desligadas ou NOP
				estado <= S4;

			elsif OP(15) = '1' then																				-- HLT
				estado <= S13;
				
			else estado <= S5;																					
			end if;
			
		when S3 => estado <= S0;
						
		when S4 => estado <= S0;
			
		when S5 => 
			if (OP(8) = '1') OR (OP(9)='1' AND N = '1') OR (OP(10)='1' AND Z = '1') then 	-- JMP e JMPS condicionais 
				estado <= S6;
			else
				estado <= S8;
			end if;
			
		when S6 => estado <= S7;
	
		when S7 => estado <= S0;
	
		when S8 => estado <= S9;

		when S9 =>
				if OP(1) = '1' then																				-- STA
					estado <= S10;
				else
					estado <= S11;
				end if;
							
		when S10 => estado <= S0;
		
		when S11 => estado <= S12;
		
		when S12 => estado <= S0;
		
		when S13 => estado <= S13;
		
		when others => estado <= S0;
		
		end case;
		
	end if;

end process;
	

process(OP, estado)
begin

	case estado is
		
		when S0=>
			carga_AC <= '0';		-- Desliga estágios que o precederam
			carga_NZ <= '0';
			carga_PC <= '0';
			Inc_PC <= '0';
			RAM_Write <= '0';
		
			sel_mux <= '0';
			carga_REM <= '1';
			
		when S1=>
			carga_REM <= '0';
			
			Inc_PC <= '1';
			carga_RDM <= '1';
			
		when S2=>
			Inc_PC <= '0';
			carga_RDM <= '0';
			
			carga_RI<= '1';
			
		when S3 =>		
			carga_RI<= '0';
			
			if OP(6) = '1' then
				sel_ULA <= "011";			-- NOT
			elsif OP(13) = '1' then
				sel_ULA <= "110";			-- SHL
			end if;
			
			carga_AC <= '1';
			carga_NZ <= '1';
			
		when S4 =>
			carga_RI <= '0';
			
			Inc_PC <= '1';
			
		when S5 => 
			carga_RI <= '0';
			sel_mux <= '0';
			carga_REM <= '1';
			
		when S6 =>
			carga_RDM <= '0';
			
			--READ
			carga_RDM <= '1';
			
		when S7 =>
			carga_RDM <= '0';
			
			carga_PC <= '1';
			
		when S8 =>
			carga_REM <= '0';
			
			--READ
			Inc_PC <= '1';
			carga_RDM <= '1';
			
		when S9 =>
			Inc_PC <= '0';
			carga_RDM <= '0';
			
			sel_mux <= '1';
			carga_REM <= '1';
			
		when S10 =>
			carga_REM <= '0';
			
			RAM_Write <= '1';
			
		when S11 =>
			carga_REM <= '0';
			
			carga_RDM <= '1';
			
		when S12 =>
			carga_RDM <= '0';
			
			if OP(2) = '1' then
				sel_ULA <= "100";		--STA
			elsif OP(3) = '1' then
				sel_ULA <= "000";		--ADD
			elsif OP(5) = '1' then
				sel_ULA <= "001";		--AND
			elsif OP(4) = '1' then
				sel_ULA <= "010";		--OR
			elsif OP(12) = '1' then
				sel_ULA <= "101";		--SUB
			end if;

			carga_AC <= '1';
			carga_NZ <= '1';
			
			when others => carga_RI <= '0';
			
		end case;
end process;
	
end Behavioral;

