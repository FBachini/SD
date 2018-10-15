----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:49 10/14/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end main;

architecture Behavioral of main is

	COMPONENT Decod
	PORT(
		A : IN std_logic_vector(3 downto 0);          		-- Decodificador 4x16
		S : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
-------------------------------------------------------------------------------------------------------------

	COMPONENT PC
	PORT(
		carga_PC : IN std_logic;
		Inc_PC : IN std_logic;
		rst : IN std_logic;
		A : IN std_logic_vector(7 downto 0);					-- Program Counter
		clk : IN std_logic;          
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
-------------------------------------------------------------------------------------------------------------


	COMPONENT Reg
	PORT(
		A : IN std_logic_vector(7 downto 0);
		clk : IN std_logic;
		carga : IN std_logic;          							-- Registrador Genérico
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
-------------------------------------------------------------------------------------------------------------

	COMPONENT RegNZ
	PORT(
		A : IN std_logic;
		B : IN std_logic;												-- Registrador NZ
		clk : IN std_logic;          								-- A -> N
		N : OUT std_logic;											-- B -> Z
		Z : OUT std_logic
		);
	END COMPONENT;
	
-------------------------------------------------------------------------------------------------------------

	COMPONENT ULA
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);					-- Unidade Lógica-Aritmética
		sel_ULA : IN std_logic_vector(2 downto 0);          
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
-------------------------------------------------------------------------------------------------------------

	COMPONENT mux21
	PORT(
		A : IN std_logic_vector(7 downto 0);					-- Multiplexador 2x1
		B : IN std_logic_vector(7 downto 0);					-- Sel = 0 -> A
		sel : IN std_logic;          								-- Sel = 1 -> B
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
------------------------------------------------------------------------------------------------------------

	COMPONENT FSM
	PORT(
		OP : IN std_logic_vector(15 downto 0);
		N : IN std_logic;
		Z : IN std_logic;
		clk : IN std_logic;
		rst : IN std_logic;          
		carga_REM : OUT std_logic;											-- FSM (Unidade de Controle)
		carga_RDM : OUT std_logic;											
		carga_RI : OUT std_logic;
		sel_ULA : OUT std_logic_vector(2 downto 0);
		carga_AC : OUT std_logic;
		carga_NZ : OUT std_logic;
		carga_PC : OUT std_logic;
		Inc_PC : OUT std_logic;
		RAM_Write : OUT std_logic;
		sel_mux : OUT std_logic
		);
	END COMPONENT;

------------------------------------------------------------------------------------------------------------

	COMPONENT mem2
		PORT (
		clka : IN STD_LOGIC;
		wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);						-- Memória Dual Port
		dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		clkb : IN STD_LOGIC;
		addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

-----------------------------------------------------------------------------------------------------------

	COMPONENT mem1
		PORT (
		clka : IN STD_LOGIC;
		wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);					-- Memória Single Port
		addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

------------------------------------------------------------------------------------------------------------

signal sPC : STD_LOGIC_VECTOR(7 downto 0);
signal cPC : STD_LOGIC;
signal IPC : STD_LOGIC;

signal sRAM : STD_LOGIC_VECTOR(7 downto 0);

signal sMUX : STD_LOGIC_VECTOR(7 downto 0);
signal selmux : STD_LOGIC_VECTOR(7 downto 0);

signal cREM : STD_LOGIC_VECTOR(7 downto 0);
signal sREM : STD_LOGIC_VECTOR(7 downto 0);

signal sRDM : STD_LOGIC_VECTOR(7 downto 0);
signal cRDM : STD_LOGIC_VECTOR(7 downto 0);
-----------------------------------------------------------------------------------------------------------

begin

	
ProgC: PC PORT MAP(
		carga_PC => cPC,
		Inc_PC => IPC,
		rst => rst,
		A => sRDM,
		S => sPC,
		clk => clk
	);
	
multiplex: mux21 PORT MAP(
		A => sPC,
		B => sRDM,
		sel => selmux,
		S => sMUX
	);
	
iREM: Reg PORT MAP(
		A => sMUX,
		clk => clk,
		carga => cREM,
		S => sREM
	);
	
	
memdosguri : mem1
  PORT MAP (
    clka => clk,
    wea => wea,
    addra => sREM,
    dina => dina,
    douta => sRAM
  );
	
	
RDM: Reg PORT MAP(
		A => sRAM,
		clk => clk,
		carga => cRDM,
		S => sRDM
	);
	

	
ACC: Reg PORT MAP(
		A => ,
		clk => clk,
		carga => ,
		S => 
	);
	
RegNeZ: RegNZ PORT MAP(
		A => ,
		B => ,
		clk => clk,
		N => ,
		Z => 
	);
	
UAL: ULA PORT MAP(
		A => ,
		B => ,
		sel_ULA => ,
		S => 
	);


	
Decodificador: Decod PORT MAP(
		A => ,
		S => 
	);


UC: FSM PORT MAP(
		OP => ,
		N => ,
		Z => ,
		clk => ,
		rst => ,
		carga_REM => cREM,
		carga_RDM => ,
		carga_RI => ,
		sel_ULA => ,
		carga_AC => ,
		carga_NZ => ,
		carga_PC => cPC,
		Inc_PC => ,
		RAM_Write => ,
		sel_mux => selmux
	);
	
	



end Behavioral;

